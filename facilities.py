import pandas as pd
from sqlalchemy import create_engine, Column, String, text
from sqlalchemy.orm import declarative_base
import pymysql
import numpy as np

# Connect to the databases
engine = create_engine('mysql+pymysql://root:@localhost:3306/facility')
conn = engine.connect()

engine1 = create_engine('mysql+pymysql://root:@localhost:3306/hivdatabase')
conn1 = engine1.connect()

# Query the three tables
query_province = "SELECT province_id, name AS province_name FROM province"
query_district = "SELECT district_id, name AS district_name FROM district"
query_facility = "SELECT facility_id, name AS facility_name, longitude, latitude, impilo_code, dhis_code FROM facility"

# Read the results into DataFrames
df_province = pd.read_sql_query(query_province, engine)
df_district = pd.read_sql_query(query_district, engine)
df_facility = pd.read_sql_query(query_facility, engine)

# Merge data
merged_df = df_facility.merge(df_district, left_on=df_facility['facility_id'].str[:6], right_on='district_id')
merged_df = merged_df.merge(df_province, left_on=merged_df['facility_id'].str[:4], right_on='province_id')

# Reorder columns
column_order = ['facility_id', 'district_id', 'province_id', 'longitude', 'latitude', 'impilo_code', 'dhis_code', 'facility_name', 'district_name', 'province_name']
merged_df = merged_df[column_order]

Base = declarative_base()

class Facility(Base):
    __tablename__ = 'facility'
    facility_id = Column(String(255), primary_key=True)
    district_id = Column(String(255))
    province_id = Column(String(255))
    longitude = Column(String(255))
    latitude = Column(String(255))
    impilo_code = Column(String(255))
    dhis_code = Column(String(255))
    facility_name = Column(String(255))
    district_name = Column(String(255))
    province_name = Column(String(255))

    def __repr__(self):
        return f"Facility(facility_id='{self.facility_id}', district_id='{self.district_id}')"

def backup_data(df, filename):
    backup_script = "CREATE TABLE IF NOT EXISTS facility (\n"
    columns = [f"{col} VARCHAR(255)" for col in df.columns]
    columns[0] += " PRIMARY KEY"  # Set the primary key for facility_id
    backup_script += ",\n".join(columns)
    backup_script += "\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n\n"

    # Function to convert NaN to 'NULL' and other values to their string representation
    def value_to_string(value):
        if isinstance(value, float) and np.isnan(value):
            return 'NULL'
        elif value is None:
            return 'NULL'
        else:
            return repr(value)

    # Generate INSERT statements with proper escaping
    insert_statements = []
    for index, row in df.iterrows():
        placeholders = ', '.join(['%s'] * len(row))
        values = [value_to_string(v) for v in row.values]
        insert_statement = f"INSERT INTO facility ({', '.join(df.columns)}) VALUES ({placeholders});"
        insert_statements.append(insert_statement % tuple(values))

    backup_script += '\n'.join(insert_statements)

    with open(filename, 'w') as f:
        f.write(backup_script)
    print("Backup data script generated successfully")

# Generate and save the backup SQL script
backup_data(merged_df, 'facility_data_backup.sql')

try:
    # Read and execute the backup SQL script
    with open('facility_data_backup.sql', 'r') as file:
        backup_sql = file.read()

    # Split by ';' and execute each command
    sql_commands = backup_sql.split(';')
    with engine1.begin() as conn1:  # Use context manager to handle transactions
        for command in sql_commands:
            if command.strip():  # Ensure the command is not empty
                try:
                    conn1.execute(text(command))
                except Exception as e:
                    print(f"Error executing command: {command}")
                    print(f"Error details: {str(e)}")

    print("Backup data imported successfully")
except Exception as e:
    print(f"An error occurred during the backup process: {str(e)}")

print("Backup data imported successfully")

conn.close()
# No need to explicitly close conn1, it's handled by the context manager
