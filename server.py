import pyodbc
import time

# Define the connection parameters
server = '84.247.163.243'  # e.g., 'localhost\SQLEXPRESS' or '192.168.1.100'
database = 'RETAIL'  # e.g., 'TestDB'
username = 'sa'  # e.g., 'sa'
password = 'FCISQL123#12'  # e.g., 'yourStrong(!)Password'

# Start the timer
start_time = time.time()

try:
    # Establish the connection
    connection = pyodbc.connect(
        'DRIVER={ODBC Driver 17 for SQL Server};'
        f'SERVER={server};'
        f'DATABASE={database};'
        f'UID={username};'
        f'PWD={password}'
    )

    # Create a cursor object using the connection
    cursor = connection.cursor()

    # Execute a simple query
    cursor.execute("SELECT 1")

    # Fetch the result to ensure the query was executed
    cursor.fetchone()

    # Stop the timer
    end_time = time.time()

    # Calculate and print the connection and query execution time
    print(f"Connection and query execution time: {end_time - start_time:.6f} seconds")

except Exception as e:
    print(f"An error occurred: {e}")

finally:
    # Close the connection
    if 'connection' in locals():
        connection.close()

