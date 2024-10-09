import os
import re
import subprocess
import pymysql
import pandas as pd
from sqlalchemy import create_engine, text


# Database connection details
source_db_config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost',
    'database': ''
}

target_db_config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost',
    'database': 'hivdatabase'
}

# Connect to source and target databases using SQLAlchemy
source_engine = create_engine(f"mysql+pymysql://{source_db_config['user']}:{source_db_config['password']}@{source_db_config['host']}/{source_db_config['database']}")
target_engine = create_engine(f"mysql+pymysql://{target_db_config['user']}:{target_db_config['password']}@{target_db_config['host']}/{target_db_config['database']}")

backup_folder = "/home/devoop/Documents/eHR/mutare"
# backup_folder = "/home/devoop/Documents/eHR/Databases"
container_name = "mysql"

def get_site_id(metadata):
    """Returns the siteId from the metadata string."""
    match = re.search(r"<string>siteId</string><string>(.*?)</string>", metadata)
    if match:
        return match.group(1)
    else:
        return None

def get_time(metadata):
    """Returns the time from the metadata string."""
    match = re.search(r"<string>time</string><string>(.*?)</string>", metadata)
    if match:
        return match.group(1)
    else:
        return None

def get_version(metadata):
    """Returns the version from the metadata string."""
    match = re.search(r"<string>version</string><string>(.*?)</string>", metadata)
    if match:
        return match.group(1)
    else:
        return None

def get_username(metadata):
    """Returns the username from the metadata string."""
    match = re.search(r"<string>username</string><string>(.*?)</string>", metadata)
    if match:
        return match.group(1)
    else:
        return None

def process_site_information_data():
    metadata_query = "SELECT meta_data FROM mrs.domain_event_entry WHERE time_stamp = (SELECT MAX(time_stamp) FROM mrs.domain_event_entry)"
    metadata_df = pd.read_sql(metadata_query, source_engine)
    if len(metadata_df['meta_data']) != 0:
        meta_data = metadata_df['meta_data'].iloc[0].decode("utf-8")
        site_id = get_site_id(meta_data)
        time = get_time(meta_data)
        version = get_version(meta_data)
        # username = get_username(meta_data)
        # print(f"*** Fetching site code successful *** SITE_CODE: [{site_id}] - EHR_VERSION: [{version}] - LAST_USED [{time}]")
        return site_id

# Create target database if it does not exist
def create_database_if_not_exists(config):
    connection = pymysql.connect(user=config['user'], password=config['password'], host=config['host'])
    cursor = connection.cursor()
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS {config['database']}")
    connection.close()

# Function to create table based on DataFrame structure with primary keys
def create_table_from_df(engine, df, table_name, primary_key_columns):
    # Convert pandas data types to MySQL-compatible data types
    mysql_data_types = {
        'int64': 'INT',
        'float64': 'FLOAT',
        'bool': 'TINYINT(1)',  # Assuming boolean values
        'category': 'VARCHAR(255)',  # Assuming category type is stored as string
        'object': 'VARCHAR(255)',
        'datetime64[ns]': 'DATETIME',  # Changed from DATE to DATETIME to accommodate time as well
        'date': 'DATE',  # Explicitly mapping pandas date type to MySQL DATE type
        'timedelta64[ns]': 'TIME',  # Handling timedelta for time-only fields
        'str': 'VARCHAR(255)',  # Added explicit mapping for string type
        'np.datetime64': 'DATETIME',  # Explicitly handling numpy datetime objects
        'np.timedelta64': 'TIME'  # Explicitly handling numpy timedelta objects
    }
    columns = ", ".join([f"{col} {mysql_data_types[str(df[col].dtype)]}" for col in df.columns])
    primary_key = ", ".join(primary_key_columns)
    create_table_query = f"CREATE TABLE IF NOT EXISTS {table_name} ({columns}, PRIMARY KEY ({primary_key}))"
    with engine.connect() as connection:
        connection.execute(text(create_table_query))

def read_processed_files(folder):
    """Reads the names of processed files from a.txt file in the given folder."""
    backup_file_path = os.path.join(folder, 'processed_files.txt')
    if os.path.exists(backup_file_path):
        with open(backup_file_path, 'r') as file:
            return [line.strip() for line in file.readlines()]
    return []

def load_sql_file_into_mysql(sql_file, container_name, db_name, root_password):
    create_database_if_not_exists(target_db_config)
    print(f"Checking if {sql_file} has been processed...")
    if os.path.abspath(sql_file) in read_processed_files(backup_folder):
        print(f"{sql_file} has been processed. Skipping.")
        return
    print(f"Loading {sql_file} into MySQL container...")
    subprocess.run(["docker", "cp", sql_file, f"{container_name}:/tmp/backup.sql"], check=True)
    env = os.environ.copy()
    env['MYSQL_PWD'] = root_password
    command = f"mysql --binary-mode=1 -u root -p{root_password} {db_name} < /tmp/backup.sql"
    subprocess.run(["docker", "exec", "-i", container_name, "sh", "-c", command], check=True, env=env)
    #create_database_if_not_exists(target_db_config)
    write_processed_file_to_backup(sql_file)

def write_processed_file_to_backup(file_name):
    """Writes the name of a processed file to a.txt file in the backup folder."""
    backup_file_path = os.path.join(backup_folder, 'processed_files.txt')
    with open(backup_file_path, 'a') as file:
        file.write(os.path.abspath(file_name) + '\n')

# Function to insert data into target table while ignoring duplicates
def insert_data_ignore_duplicates(engine, df, table_name, primary_key_columns):
    temp_table_name = f"temp_{table_name}"
    create_table_from_df(engine, df, temp_table_name, primary_key_columns)
    df.to_sql(temp_table_name, engine, if_exists='append', index=False)
    
    primary_keys = ", ".join(primary_key_columns)
    columns = ", ".join(df.columns)
    insert_query = f"""
        INSERT IGNORE INTO {table_name} ({columns})
        SELECT {columns} FROM {temp_table_name}
    """
    
    with engine.connect() as connection:
        connection.execute(text(insert_query))
        connection.execute(text(f"DROP TABLE {temp_table_name}"))

def write_processed_file_to_backup(file_name):
    """Writes the name of a processed file to a.txt file in the backup folder."""
    backup_file_path = os.path.join(backup_folder, 'processed_files.txt')
    with open(backup_file_path, 'a') as file:
        file.write(file_name + '\n')

def process_anc_register_data():
    anc_register_query = "SELECT anc_id,date AS registered_date,site_id,anc_number,art_initiated,art_number,edd,hiv_status,lnmp,person_id FROM report.anc_register"
    anc_register_df = pd.read_sql(anc_register_query, source_engine)
    create_table_from_df(target_engine, anc_register_df, 'anc_register', ['anc_id', 'registered_date'])
    insert_data_ignore_duplicates(target_engine, anc_register_df, 'anc_register', ['anc_id', 'registered_date'])

def process_anc_booked_register_data():
    site_id = process_site_information_data()
    anc_booked_register_query = "SELECT anc_id,date AS booked_date,gestational_age,patient_id,person_id,trimester FROM report.anc_booked_register"
    anc_booked_register_df = pd.read_sql(anc_booked_register_query, source_engine)
    anc_booked_register_df['site_id'] = site_id
    create_table_from_df(target_engine, anc_booked_register_df, 'anc_booked_register', ['anc_id', 'booked_date'])
    insert_data_ignore_duplicates(target_engine, anc_booked_register_df, 'anc_booked_register', ['anc_id', 'booked_date'])

def process_hts_register_data():
    hiv_query = "SELECT *,`date` AS hts_date FROM report.hts_register"
    hts_register_df = pd.read_sql(hiv_query, source_engine)
    create_table_from_df(target_engine, hts_register_df, 'hts_register', ['hts_id', 'hts_date'])
    insert_data_ignore_duplicates(target_engine, hts_register_df, 'hts_register', ['hts_id', 'hts_date'])

def process_hiv_positive_person_data():
    site_id = process_site_information_data()
    hiv_positive_person_query = "SELECT *,`result` AS hiv_positive_test_result FROM report.hiv_positive_person"
    hiv_positive_person_df = pd.read_sql(hiv_positive_person_query, source_engine)
    hiv_positive_person_df['site_id'] = site_id
    create_table_from_df(target_engine, hiv_positive_person_df, 'hiv_positive_person', ['investigation_order_id', 'visit_date'])
    insert_data_ignore_duplicates(target_engine, hiv_positive_person_df, 'hiv_positive_person', ['investigation_order_id', 'visit_date'])

def process_hts_screening_register_data():
    site_id = process_site_information_data()
    hts_screening_query = "SELECT *,`result` AS hts_screening_result FROM report.hts_screening_register"
    hts_screening_df = pd.read_sql(hts_screening_query, source_engine)
    hts_screening_df['site_id'] = site_id
    create_table_from_df(target_engine, hts_screening_df, 'hts_screening_register', ['hts_screening_id', 'patient_id'])
    insert_data_ignore_duplicates(target_engine, hts_screening_df, 'hts_screening_register', ['hts_screening_id', 'patient_id'])

def process_hts_register_test_data():
    site_id = process_site_information_data()
    hts_test_query = "SELECT order_test_id, hts_id, test_kit, time as time_tested, result as hts_register_test_result FROM report.hts_register_test"
    hts_test_df = pd.read_sql(hts_test_query, source_engine)
    hts_test_df['site_id'] = site_id
    create_table_from_df(target_engine, hts_test_df, 'hts_register_test', ['order_test_id', 'hts_id'])
    insert_data_ignore_duplicates(target_engine, hts_test_df, 'hts_register_test', ['order_test_id', 'hts_id'])

def process_art_register_data():
   art_query = "SELECT * FROM report.art_register"
   art_df = pd.read_sql(art_query, source_engine)
   create_table_from_df(target_engine, art_df, 'art_register', ['art_id', 'person_id'])
   insert_data_ignore_duplicates(target_engine, art_df, 'art_register', ['art_id', 'person_id'])

def process_art_register_followup_data():
   art_followup_query = "SELECT * FROM report.art_register_followup"
   art_followup_df = pd.read_sql(art_followup_query, source_engine)
   create_table_from_df(target_engine, art_followup_df, 'art_register_followup', ['visit_id', 'person_id'])
   insert_data_ignore_duplicates(target_engine, art_followup_df, 'art_register_followup', ['visit_id', 'person_id'])

# Extract, transform, and load data for ART transfer in register
def process_art_transfer_in_register_data():
    site_id = process_site_information_data()
    art_transfer_in_query = "SELECT id, art_id, date_of_transfer_in, transfer_facility_id FROM report.art_transfer_in_register"
    art_transfer_in_df = pd.read_sql(art_transfer_in_query, source_engine)
    art_transfer_in_df['site_id'] = site_id
    create_table_from_df(target_engine, art_transfer_in_df, 'art_transfer_in_register', ['id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_transfer_in_df, 'art_transfer_in_register', ['id', 'art_id'])

# Extract, transform, and load data for ART transfer out register
def process_art_transfer_out_register_data():
    site_id = process_site_information_data()
    art_transfer_out_query = "SELECT art_transfer_out_register_id, art_id, transfer_out_date, transfer_facility_id, transfer_reason FROM report.art_transfer_out_register"
    art_transfer_out_df = pd.read_sql(art_transfer_out_query, source_engine)
    art_transfer_out_df['site_id'] = site_id
    create_table_from_df(target_engine, art_transfer_out_df, 'art_transfer_out_register', ['art_transfer_out_register_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_transfer_out_df, 'art_transfer_out_register', ['art_transfer_out_register_id', 'art_id'])

# Extract, transform, and load data for ART visits register
def process_art_visit_register_data():
    art_visit_query = "SELECT art_visit_id, site_id, patient_id, art_id, date AS visit_date, visit_status, visit_type, functional_status, family_planning_status, lactating_status FROM report.art_visit_register"
    art_visit_df = pd.read_sql(art_visit_query, source_engine)
    create_table_from_df(target_engine, art_visit_df, 'art_visit_register', ['art_visit_id', 'visit_date'])
    insert_data_ignore_duplicates(target_engine, art_visit_df, 'art_visit_register', ['art_visit_id', 'visit_date'])

# Extract, transform, and load data for ART WHO stage register
def process_art_who_stage_register_data():
    site_id = process_site_information_data()
    art_who_stage_query = "SELECT art_stage_id, art_register_id as art_id, date as visit_date, follow_up_status as follow_up_status_at_who_stage, stage as who_stage FROM report.art_who_stage_register"
    art_who_stage_df = pd.read_sql(art_who_stage_query, source_engine)
    art_who_stage_df['site_id'] = site_id
    create_table_from_df(target_engine, art_who_stage_df, 'art_who_stage_register', ['art_stage_id', 'visit_date'])
    insert_data_ignore_duplicates(target_engine, art_who_stage_df, 'art_who_stage_register', ['art_stage_id', 'visit_date'])

# Extract, transform, and load data for ART IPT status register
def process_art_ipt_status_register_data():
    site_id = process_site_information_data()
    art_tpt_status_query = "SELECT art_ipt_status_id, art_register_id as art_id, date as visit_date, status as tpt_status FROM report.art_ipt_status_register"
    art_tpt_status_df = pd.read_sql(art_tpt_status_query, source_engine)
    art_tpt_status_df['site_id'] = site_id
    create_table_from_df(target_engine, art_tpt_status_df, 'art_ipt_status_register', ['art_ipt_status_id', 'visit_date'])
    insert_data_ignore_duplicates(target_engine, art_tpt_status_df, 'art_ipt_status_register', ['art_ipt_status_id', 'visit_date'])

# Extract, transform, and load data for ART current status register
def process_art_current_status_register_data():
    site_id = process_site_information_data()
    art_current_status_query = "SELECT art_status_id, art_register_id as art_id, date AS visit_date, adverse_event_status, reason, reason_for_regimen_substitution, regimen, regimen_from, regimen_line_name, state as arv_status, treatment_failure_reason FROM report.art_current_status_register"
    art_current_status_df = pd.read_sql(art_current_status_query, source_engine)
    art_current_status_df['site_id'] = site_id
    create_table_from_df(target_engine, art_current_status_df, 'art_current_status_register', ['art_status_id', 'visit_date'])
    insert_data_ignore_duplicates(target_engine, art_current_status_df, 'art_current_status_register', ['art_status_id', 'visit_date'])

# Extract, transform, and load data for Viral Load
def process_viral_load_data():
    site_id = process_site_information_data()
    viral_load_query = "SELECT * FROM report.viral_load_investigation_register"
    viral_load_df = pd.read_sql(viral_load_query, source_engine)
    viral_load_df['site_id'] = site_id
    create_table_from_df(target_engine, viral_load_df, 'viral_load_investigation', ['laboratory_investigation_id', 'date'])
    insert_data_ignore_duplicates(target_engine, viral_load_df, 'viral_load_investigation', ['laboratory_investigation_id', 'date'])

# Extract, transform, and load data for TB Screening
def process_tpt_screening_data():
    tpt_screening_query = "SELECT * FROM report.tpt_screening_report"
    tpt_screening_df = pd.read_sql(tpt_screening_query, source_engine)
    create_table_from_df(target_engine, tpt_screening_df, 'tpt_screening', ['patient_tpt_screening_id', 'date'])
    insert_data_ignore_duplicates(target_engine, tpt_screening_df, 'tpt_screening', ['patient_tpt_screening_id', 'date'])

# Extract, transform, and load data for ANC Visits
def process_anc_visit_data():
    anc_visit_query = "SELECT * FROM report.anc_visit_register"
    anc_visit_df = pd.read_sql(anc_visit_query, source_engine)
    create_table_from_df(target_engine, anc_visit_df, 'anc_visit', ['anc_visit_id', 'anc_id'])
    insert_data_ignore_duplicates(target_engine, anc_visit_df, 'anc_visit', ['anc_visit_id', 'anc_id'])

# Extract, transform, and load data for ART Appointments
def process_art_appointment_data():
    site_id = process_site_information_data()
    art_appointment_query = "SELECT * FROM report.art_appointment_register"
    art_appointment_df = pd.read_sql(art_appointment_query, source_engine)
    art_appointment_df['site_id'] = site_id
    create_table_from_df(target_engine, art_appointment_df, 'art_appointment', ['art_appointment_register_id', 'date'])
    insert_data_ignore_duplicates(target_engine, art_appointment_df, 'art_appointment', ['art_appointment_register_id', 'date'])

# Extract, transform, and load data for CBS
def process_cbs_data():
    cbs_query = "SELECT * FROM report.cbs_register"
    cbs_df = pd.read_sql(cbs_query, source_engine)
    create_table_from_df(target_engine, cbs_df, 'cbs', ['person_id', 'site_id'])
    insert_data_ignore_duplicates(target_engine, cbs_df, 'cbs', ['person_id', 'site_id'])

# Extract, transform, and load data for DSD Group
def process_art_dsd_group_data():
    site_id = process_site_information_data()
    dsd_group_query = "SELECT * FROM report.art_dsd_group_report"
    dsd_group_df = pd.read_sql(dsd_group_query, source_engine)
    dsd_group_df['site_id'] = site_id
    create_table_from_df(target_engine, dsd_group_df, 'art_dsd_group', ['art_dsd_group_id', 'date'])
    insert_data_ignore_duplicates(target_engine, dsd_group_df, 'art_dsd_group', ['art_dsd_group_id', 'date'])

# Extract, transform, and load data for DSD Client
def process_art_dsd_client_data():
    site_id = process_site_information_data()
    dsd_client_query = "SELECT * FROM report.art_dsd_group_client_report"
    dsd_client_df = pd.read_sql(dsd_client_query, source_engine)
    dsd_client_df['site_id'] = site_id
    create_table_from_df(target_engine, dsd_client_df, 'art_dsd_group_client', ['art_dsd_group_id', 'date_joined'])
    insert_data_ignore_duplicates(target_engine, dsd_client_df, 'art_dsd_group_client', ['art_dsd_group_id', 'date_joined'])

# Extract, transform, and load data for DSD Appointments
def process_art_dsd_appointment_data():
    site_id = process_site_information_data()
    dsd_group_appointment_query = "SELECT * FROM report.art_dsd_group_appointment_report"
    dsd_group_appointment_df = pd.read_sql(dsd_group_appointment_query, source_engine)
    dsd_group_appointment_df['site_id'] = site_id
    create_table_from_df(target_engine, dsd_group_appointment_df, 'art_dsd_group_appointment', ['id', 'appointment_date'])
    insert_data_ignore_duplicates(target_engine, dsd_group_appointment_df, 'art_dsd_group_appointment', ['id', 'appointment_date'])

def main():
    processed_files = read_processed_files(backup_folder)
    backup_files = [f for f in os.listdir(backup_folder) if os.path.isfile(os.path.join(backup_folder, f)) and f.endswith('.sql') and not f.startswith('._')]

    total_backups = len(backup_files)
    print(f"Total backup files found: {total_backups}")

    for i, backup_file in enumerate(backup_files, start=1):
        if os.path.abspath(backup_file) in processed_files:
            print(f"Skipping already processed backup file {i}/{total_backups}: {backup_file}")
            continue
        print(f"Processing backup file {i}/{total_backups}: {backup_file}")
        backup_file_path = os.path.join(backup_folder, backup_file)
        load_sql_file_into_mysql(backup_file_path, container_name, source_db_config['database'], source_db_config['password'])
        print(f"Backup file {i} processed successfully.")

        # Process Site Information and eHR details
        process_site_information_data()

         # Execute data processing steps
        process_anc_register_data()
        process_anc_booked_register_data()
        process_hts_register_data()
        process_hiv_positive_person_data()
        process_hts_screening_register_data()
        process_hts_register_test_data()
        process_art_register_data()
        process_art_transfer_in_register_data()
        process_art_transfer_out_register_data()
        process_art_visit_register_data()
        process_art_who_stage_register_data()
        process_art_ipt_status_register_data()
        process_art_current_status_register_data()
        process_viral_load_data()
        process_tpt_screening_data()
        process_anc_visit_data()
        process_art_appointment_data()
        process_cbs_data()
        process_art_dsd_group_data()
        process_art_dsd_client_data()
        process_art_dsd_appointment_data()


if __name__ == "__main__":
    main()
