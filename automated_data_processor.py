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
DATABASE_FOLDER = "/home/devoop/Documents/Datasets/data/databases"  # Directory containing all the database files
PROCESSED_FOLDER = "/home/devoop/Documents/Datasets/data/processed_databases"  # Where to move databases after processing
BACKUP_FOLDER = "/home/devoop/Documents/Datasets/data/backup_databases"  # Backup of databases before processing
TEMPLATE_DATABASE = "/home/devoop/Documents/Datasets/data/template_database/blank.sql"  # Path to your template database with setup tables
ETL_SCRIPT_PATH = "data_extraction.py"  #script
MYSQL_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "root",
    "database": "ctc2data"  # Default database name
}

class DatabaseProcessor:
    def __init__(self):
        self.create_folders()
        # Validate that template database exists
        if not Path(TEMPLATE_DATABASE).exists():
            logger.error(f"Template database not found at {TEMPLATE_DATABASE}")
            raise FileNotFoundError(f"Template database file not found: {TEMPLATE_DATABASE}")
    
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
            
            # Now load the template database using a file redirection approach that handles spaces
            with open(TEMPLATE_DATABASE, 'r') as template_file:
                mysql_cmd = [
                    'mysql',
                    f"--host={MYSQL_CONFIG['host']}",
                    f"--user={MYSQL_CONFIG['user']}",
                    f"--password={MYSQL_CONFIG['password']}",
                    MYSQL_CONFIG['database']
                ]
                
                result = subprocess.run(
                    mysql_cmd,
                    stdin=template_file,
                    capture_output=True,
                    text=True
                )
            
            if result.returncode != 0:
                logger.error(f"Failed to load template database: {result.stderr}")
                return False
                
            logger.info("Template database loaded successfully")
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
                # For SQL dumps - use file objects instead of shell redirection to handle spaces
                with open(db_path, 'r') as db_file:
                    mysql_cmd = [
                        'mysql',
                        f"--host={MYSQL_CONFIG['host']}",
                        f"--user={MYSQL_CONFIG['user']}",
                        f"--password={MYSQL_CONFIG['password']}",
                        MYSQL_CONFIG['database']
                    ]
                    
                    result = subprocess.run(
                        mysql_cmd,
                        stdin=db_file,
                        capture_output=True,
                        text=True
                    )
                
            elif file_extension in ['.csv', '.xlsx', '.xls']:
                # Add custom import logic for different file types if needed
                logger.warning(f"File type {file_extension} not directly supported for MySQL import")
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
            result = subprocess.run(
                [sys.executable, ETL_SCRIPT_PATH],
                capture_output=True,
                text=True
            )
            
            if result.returncode != 0:
                logger.error(f"ETL script failed with error: {result.stderr}")
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