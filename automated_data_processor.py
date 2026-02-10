import os
import time
import subprocess
import shutil
import logging
import sys
from pathlib import Path
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import mysql.connector
from mysql.connector import errorcode

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler("database_processing.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

# Configuration
DATA_DIR = os.environ.get("DATA_DIR", "/data")
DATABASE_FOLDER = os.path.join(DATA_DIR, "databases")
PROCESSED_FOLDER = os.path.join(DATA_DIR, "processed_databases")
BACKUP_FOLDER = os.path.join(DATA_DIR, "backup_databases")
# Use local template.sql if available (baked into container), otherwise fall back to data dir
LOCAL_TEMPLATE = "template.sql"
if Path(LOCAL_TEMPLATE).exists():
    TEMPLATE_DATABASE = str(Path(LOCAL_TEMPLATE).absolute())
else:
    TEMPLATE_DATABASE = os.path.join(DATA_DIR, "template_database/blank.sql")

ETL_SCRIPT_PATH = "data_extraction.py"  # script in the same directory

MYSQL_CONFIG = {
    "host": os.environ.get("DB_HOST", "localhost"),
    "user": os.environ.get("DB_USER", "root"),
    "password": os.environ.get("DB_PASSWORD", "root"),
    "database": os.environ.get("DB_NAME", "ctc2data")
}

class DatabaseProcessor:
    def __init__(self):
        self.create_folders()
        # Check if template database exists
        if not Path(TEMPLATE_DATABASE).exists():
            logger.warning(f"Template database not found at {TEMPLATE_DATABASE}")
            # Ensure the directory exists at least if it's in the data dir
            if TEMPLATE_DATABASE.startswith(DATA_DIR):
                Path(TEMPLATE_DATABASE).parent.mkdir(parents=True, exist_ok=True)
            
    def copy_file_robust(self, src, dst):
        """Robust file copy using shutil.copyfile and retries."""
        max_retries = 5
        for i in range(max_retries):
            try:
                # Use shutil.copyfile which is pure python
                shutil.copyfile(src, dst)
                return True
            except Exception as e:
                if i == max_retries - 1:
                    logger.error(f"Failed to copy {src} to {dst} after {max_retries} attempts: {e}")
                    return False
                logger.warning(f"Copy failed (attempt {i+1}/{max_retries}), retrying: {e}")
                time.sleep(1)
        return False
    
    def create_folders(self):
        """Create necessary folders if they don't exist."""
        for folder in [DATABASE_FOLDER, PROCESSED_FOLDER, BACKUP_FOLDER]:
            Path(folder).mkdir(parents=True, exist_ok=True)
            logger.info(f"Ensured folder exists: {folder}")
    
    def process_database_file(self, db_path):
        """Process a single database file."""
        db_path = Path(db_path)
        
        if not db_path.exists():
            logger.error(f"Database file not found: {db_path}")
            return False
        
        db_name = db_path.stem
        try:
            # Backup the file first
            backup_path = Path(BACKUP_FOLDER) / db_path.name
            shutil.copy2(db_path, backup_path)
            logger.info(f"Backed up database to {backup_path}")
            
            # Reset MySQL database and load template
            if self.reset_and_load_template():
                logger.info(f"Template database loaded successfully")
                
                # Load actual database on top of template
                if self.load_database_to_mysql(db_path):
                    logger.info(f"Successfully loaded database {db_name} on top of template")
                    
                    # Run ETL script
                    if self.run_etl_script():
                        logger.info(f"ETL processing completed for {db_name}")
                        
                        # Move to processed folder
                        processed_path = Path(PROCESSED_FOLDER) / db_path.name
                        shutil.move(db_path, processed_path)
                        logger.info(f"Moved database to processed folder: {processed_path}")
                        
                        return True
                else:
                    logger.error(f"Failed to load database {db_name}")
            else:
                logger.error("Failed to reset database and load template")
            
            return False
            
        except Exception as e:
            logger.exception(f"Error processing database {db_name}: {e}")
            return False
    
    def reset_and_load_template(self):
        """Drop and recreate the database, then load the template database."""
        try:
            # First, drop and recreate the database
            conn = mysql.connector.connect(
                host=MYSQL_CONFIG["host"],
                user=MYSQL_CONFIG["user"],
                password=MYSQL_CONFIG["password"]
            )
            cursor = conn.cursor()
            
            # Drop and recreate database
            cursor.execute(f"DROP DATABASE IF EXISTS {MYSQL_CONFIG['database']}")
            cursor.execute(f"CREATE DATABASE {MYSQL_CONFIG['database']} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
            logger.info(f"Reset database {MYSQL_CONFIG['database']}")
            
            cursor.close()
            conn.close()
            
            # Now load the template database
            if Path(TEMPLATE_DATABASE).exists():
                try:
                    # If template is local, we don't need to copy it to tmp unless we want to
                    # But if it's the one in /app/template.sql, reading it is safe (no deadlock)
                    # However, if we fallback to /data/..., we should copy.
                    
                    if TEMPLATE_DATABASE.startswith("/app") or not TEMPLATE_DATABASE.startswith("/data"):
                        # Local file, just read it
                        with open(TEMPLATE_DATABASE, 'r') as f:
                            template_content = f.read()
                    else:
                        # Mounted file, use robust copy
                        temp_template = Path("/tmp/temp_template.sql")
                        if not self.copy_file_robust(TEMPLATE_DATABASE, temp_template):
                            logger.error("Failed to copy template database to temp location")
                            return False
                        
                        with open(temp_template, 'r') as f:
                            template_content = f.read()
                        
                        # Clean up temp file
                        if temp_template.exists():
                            temp_template.unlink()
                        
                    mysql_cmd = [
                        'mysql',
                        f"--host={MYSQL_CONFIG['host']}",
                        f"--user={MYSQL_CONFIG['user']}",
                        f"--password={MYSQL_CONFIG['password']}",
                        "--skip-ssl-verify-server-cert",
                        MYSQL_CONFIG['database']
                    ]
                    
                    result = subprocess.run(
                        mysql_cmd,
                        input=template_content,
                        capture_output=True,
                        text=True
                    )
                    
                    if result.returncode != 0:
                        logger.error(f"Failed to load template database: {result.stderr}")
                        return False
                        
                    logger.info("Template database loaded successfully")
                except Exception as e:
                    logger.error(f"Error reading template database file: {e}")
                    return False
            else:
                logger.warning("Template database file not found. Proceeding with empty database.")
                
            return True
            
        except mysql.connector.Error as err:
            logger.error(f"MySQL Error: {err}")
            return False
        except Exception as e:
            logger.exception(f"Error resetting database and loading template: {e}")
            return False
    
    def load_database_to_mysql(self, db_path):
        """Load the database file into MySQL on top of the template."""
        try:
            # Determine if this is a SQL dump or another format
            file_extension = db_path.suffix.lower()
            
            if file_extension == '.sql':
                # For SQL dumps - use temp file copy to avoid file locking issues
                try:
                    # Copy to /tmp first using system cp with retries
                    temp_db = Path("/tmp/temp_db.sql")
                    if not self.copy_file_robust(db_path, temp_db):
                        logger.error(f"Failed to copy database {db_path} to temp location")
                        return False
                    
                    with open(temp_db, 'r', encoding='utf-8', errors='ignore') as f:
                        db_content = f.read()
                        
                    # Fix MySQL 8.0+ / MariaDB compatibility issues
                    # Remove NO_AUTO_CREATE_USER which was removed in newer versions
                    if "NO_AUTO_CREATE_USER" in db_content:
                        logger.info("Removing incompatible NO_AUTO_CREATE_USER from sql_mode")
                        db_content = db_content.replace("NO_AUTO_CREATE_USER,", "")
                        db_content = db_content.replace(",NO_AUTO_CREATE_USER", "")
                        db_content = db_content.replace("NO_AUTO_CREATE_USER", "")
                        
                    # Clean up temp file
                    if temp_db.exists():
                        temp_db.unlink()
                        
                    mysql_cmd = [
                        'mysql',
                        f"--host={MYSQL_CONFIG['host']}",
                        f"--user={MYSQL_CONFIG['user']}",
                        f"--password={MYSQL_CONFIG['password']}",
                        "--skip-ssl-verify-server-cert",
                        MYSQL_CONFIG['database']
                    ]
                    
                    result = subprocess.run(
                        mysql_cmd,
                        input=db_content,
                        capture_output=True,
                        text=True
                    )
                except Exception as e:
                    logger.error(f"Error reading database file {db_path}: {e}")
                    return False
                
            elif file_extension in ['.csv', '.xlsx', '.xls', '.dta']:
                # These are likely output files or data files, not database dumps
                logger.info(f"Skipping {file_extension} file {db_path.name} as it is not a SQL database dump.")
                return False
                
            else:
                logger.error(f"Unsupported file type: {file_extension}")
                return False
                
            if result.returncode != 0:
                logger.error(f"Failed to load database: {result.stderr}")
                return False
                
            return True
            
        except Exception as e:
            logger.exception(f"Error loading database: {e}")
            return False
    
    def run_etl_script(self):
        """Run the ETL script on the loaded database."""
        try:
            # Pass environment variables to the subprocess
            env = os.environ.copy()
            
            result = subprocess.run(
                [sys.executable, ETL_SCRIPT_PATH],
                capture_output=True,
                text=True,
                env=env
            )
            
            if result.returncode != 0:
                logger.error(f"ETL script failed with error: {result.stderr}")
                if result.stdout:
                    logger.error(f"ETL script stdout: {result.stdout}")
                return False
                
            logger.info(f"ETL output: {result.stdout}")
            return True
            
        except Exception as e:
            logger.exception(f"Error running ETL script: {e}")
            return False
    
    def process_all_databases(self):
        """Process all databases in the specified folder."""
        db_files = list(Path(DATABASE_FOLDER).glob("*"))
        logger.info(f"Found {len(db_files)} database files to process")
        
        for db_path in db_files:
            logger.info(f"Processing {db_path.name}...")
            if self.process_database_file(db_path):
                logger.info(f"Successfully processed {db_path.name}")
            else:
                logger.error(f"Failed to process {db_path.name}")

class DatabaseWatcher(FileSystemEventHandler):
    def __init__(self):
        self.processor = DatabaseProcessor()
        self.processing = False
        
    def on_created(self, event):
        """Handle file creation event."""
        if event.is_directory:
            return
            
        if self.processing:
            logger.info(f"Already processing a database, will handle {event.src_path} later")
            return
            
        self.processing = True
        try:
            logger.info(f"New database detected: {event.src_path}")
            time.sleep(2)  # Wait a bit to ensure file is fully written
            self.processor.process_database_file(event.src_path)
        finally:
            self.processing = False

def watch_folder():
    """Watch the database folder for new files."""
    event_handler = DatabaseWatcher()
    observer = Observer()
    observer.schedule(event_handler, DATABASE_FOLDER, recursive=False)
    observer.start()
    
    logger.info(f"Watching folder {DATABASE_FOLDER} for new database files...")
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

def create_template_database():
    """Create a template database from an existing database."""
    print("\nTemplate Database Creation Utility")
    print("=================================")
    
    # Get source database details
    source_db = input("Enter path to source database SQL file: ")
    if not Path(source_db).exists():
        print(f"Error: Source file {source_db} not found.")
        return
    
    template_path = input(f"Enter output path for template (default: {TEMPLATE_DATABASE}): ") or TEMPLATE_DATABASE
    
    # Create template directory if it doesn't exist
    Path(template_path).parent.mkdir(parents=True, exist_ok=True)
    
    # Create a template database
    conn = mysql.connector.connect(
        host=MYSQL_CONFIG["host"],
        user=MYSQL_CONFIG["user"],
        password=MYSQL_CONFIG["password"]
    )
    cursor = conn.cursor()
    
    try:
        temp_db = "temp_template_db"
        cursor.execute(f"DROP DATABASE IF EXISTS {temp_db}")
        cursor.execute(f"CREATE DATABASE {temp_db}")
        conn.commit()
        
        print("Loading source database...")
        # Use file objects instead of shell redirection
        with open(source_db, 'r') as source_file:
            mysql_cmd = [
                'mysql',
                f"--host={MYSQL_CONFIG['host']}",
                f"--user={MYSQL_CONFIG['user']}",
                f"--password={MYSQL_CONFIG['password']}",
                "--skip-ssl",
                temp_db
            ]
            subprocess.run(mysql_cmd, stdin=source_file)
        
        print("Extracting structure and reference data...")
        tables_to_extract = ["facility", "tblsetupregions", "tblsetupdistricts"] 
        
        # Extract structure for all tables - handle spaces in paths
        with open(template_path, 'w') as output_file:
            mysqldump_cmd = [
                'mysqldump',
                f"--host={MYSQL_CONFIG['host']}",
                f"--user={MYSQL_CONFIG['user']}",
                f"--password={MYSQL_CONFIG['password']}",
                "--skip-ssl",
                '--no-data',
                temp_db
            ]
            subprocess.run(mysqldump_cmd, stdout=output_file)
        
        # Extract data for reference tables - append to file
        with open(template_path, 'a') as output_file:
            mysqldump_cmd = [
                'mysqldump',
                f"--host={MYSQL_CONFIG['host']}",
                f"--user={MYSQL_CONFIG['user']}",
                f"--password={MYSQL_CONFIG['password']}",
                "--skip-ssl",
                temp_db
            ] + tables_to_extract
            subprocess.run(mysqldump_cmd, stdout=output_file)
        
        print(f"Template database created at {template_path}")
        
    except Exception as e:
        print(f"Error creating template database: {e}")
    finally:
        cursor.execute(f"DROP DATABASE IF EXISTS {temp_db}")
        cursor.close()
        conn.close()

def main():
    if len(sys.argv) > 1:
        if sys.argv[1] == '--watch':
            logger.info("Starting Database Processor in WATCH mode...")
            # First process any existing files
            try:
                processor = DatabaseProcessor()
                processor.process_all_databases()
            except Exception as e:
                logger.error(f"Error processing existing files: {e}")
            
            # Then start watching
            watch_folder()
        elif sys.argv[1] == '--create-template':
            create_template_database()
        else:
            print(f"Unknown command: {sys.argv[1]}")
            print("Available commands: --watch, --create-template")
    else:
        try:
            processor = DatabaseProcessor()
            processor.process_all_databases()
        except Exception as e:
            logger.exception(f"Error in main process: {e}")

if __name__ == "__main__":
    main()
