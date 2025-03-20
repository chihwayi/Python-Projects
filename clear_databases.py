import mysql.connector
from mysql.connector import Error
import os

# Database connection parameters
databases = {
    'client': {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'root',
        'password': 'root',
        'database': 'client'
    },
    'consultation': {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'root',
        'password': 'root',
        'database': 'consultation'
    },
    'report': {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'root',
        'password': 'root',
        'database': 'report'
    }
}

def clear_database(db_config: dict) -> None:
    """Clear all data from a database while preserving structure."""
    try:
        # Establish connection
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()
        
        # Temporarily disable foreign key checks
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
        
        # Get all tables
        cursor.execute("SHOW TABLES")
        tables = [row[0] for row in cursor.fetchall()]
        
        # Clear each table
        for table in tables:
            print(f"Clearing table: {table}")
            try:
                cursor.execute(f"TRUNCATE TABLE {table}")
            except Error as e:
                print(f"Error truncating {table}: {str(e)}")
                # Try DELETE if TRUNCATE fails
                cursor.execute(f"DELETE FROM {table}")
        
        # Re-enable foreign key checks
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
        
        connection.commit()
        print(f"\nSuccessfully cleared database: {db_config['database']}")
        
    except Error as e:
        print(f"Error clearing database {db_config['database']}: {str(e)}")
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()

def main():
    """Main function to clear both databases."""
    print("Warning: This will permanently delete ALL data from both databases!")
    input("Press Enter to continue, Ctrl+C to cancel...")
    
    for db_name, config in databases.items():
        clear_database(config)

if __name__ == "__main__":
    main()