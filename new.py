import os
import re
import subprocess
import pymysql
import pandas as pd
from sqlalchemy import create_engine, text
from sqlalchemy.exc import IntegrityError
import logging

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
container_name = "mysql"

# Configure logging
log_file= os.path.join(backup_folder, 'log.txt')
logging.basicConfig(filename=log_file, level=logging.ERROR)

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
        return site_id

# Create target database if it does not exist
def create_database_if_not_exists(config):
    connection = pymysql.connect(user=config['user'], password=config['password'], host=config['host'])
    cursor = connection.cursor()
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS {config['database']}")
    connection.close()

# Function to create table based on DataFrame structure with primary keys
def create_table_from_df(engine, df, table_name, primary_key_columns):
    mysql_data_types = {
        'int64': 'INT(11)',
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
    backup_file_path = os.path.join(folder, 'processed_files.txt')
    if os.path.exists(backup_file_path):
        with open(backup_file_path, 'r') as file:
            return [line.strip() for line in file.readlines()]
    return []

def read_error_files(folder):
    error_log_path = os.path.join(folder, 'error.txt')
    if os.path.exists(error_log_path):
        with open(error_log_path, 'r') as file:
            return [line.strip() for line in file.readlines()]
    return []

def log_error(file_path):
    error_log_path = os.path.join(backup_folder, 'error.txt')
    with open(error_log_path, 'a') as error_file:
        error_file.write(f"{file_path}\n")

def load_sql_file_into_mysql(sql_file, container_name, db_name, root_password):

    create_database_if_not_exists(target_db_config)

    print(f"Checking if {sql_file} has been processed...")
    
    # Check against both processed files and error logs
    if os.path.abspath(sql_file) in read_processed_files(backup_folder) or os.path.abspath(sql_file) in read_error_files(backup_folder):
        print(f"{sql_file} has been processed (either successfully or encountered an error). Skipping.")
        return
    
    else:
        print(f"Loading {sql_file} into MySQL container...")
        try:
            subprocess.run(["docker", "cp", sql_file, f"{container_name}:/tmp/backup.sql"], check=True)
            env = os.environ.copy()
            env['MYSQL_PWD'] = root_password
            command = f"mysql --binary-mode=1 -u root -p{root_password} {db_name} < /tmp/backup.sql"
            subprocess.run(["docker", "exec", "-i", container_name, "sh", "-c", command], check=True, env=env)

            write_processed_file_to_backup(sql_file)

            process_all_data()

        except subprocess.CalledProcessError as e:
            error_message = f"Error processing {sql_file}: {e}"
            print(error_message)
            log_error(sql_file)

        except Exception as e:
            error_message = f"Unexpected error processing {sql_file}: {e}"
            print(error_message)
            log_error(sql_file)

def write_processed_file_to_backup(file_name):
    backup_file_path = os.path.join(backup_folder, 'processed_files.txt')
    with open(backup_file_path, 'a') as file:
        file.write(os.path.abspath(file_name) + '\n')

def coerce_date_format(date_series):
    def correct_format(date):
        if isinstance(date, str):
            if re.match(r'\d{2}-\d{2}-\d{2}', date):
                return f"20{date}"
        return date
    return pd.to_datetime(date_series.apply(correct_format), errors='coerce')

def insert_data_ignore_duplicates(engine, df, table_name, primary_key_columns):
    temp_table_name = f"temp_{table_name}"
    create_table_from_df(engine, df, temp_table_name, primary_key_columns)
    
    # Insert data in small batches to handle duplicates gracefully
    batch_size = 1000
    for start in range(0, len(df), batch_size):
        end = start + batch_size
        df_batch = df.iloc[start:end]
        try:
            df_batch.to_sql(temp_table_name, engine, if_exists='append', index=False)
        except IntegrityError as e:
            print(f"IntegrityError on batch {start}-{end}: {e}")
            logging.error(f"IntegrityError on batch {start}-{end}: {e}")
    
    primary_keys = ", ".join(primary_key_columns)
    columns = ", ".join(df.columns)
    insert_query = f"""
        INSERT IGNORE INTO {table_name} ({columns})
        SELECT {columns} FROM {temp_table_name}
    """
    
    with engine.connect() as connection:
        try:
            connection.execute(text(insert_query))
        except IntegrityError as e:
            print(f"IntegrityError during final insert: {e}")
            logging.error(f"IntegrityError during final insert: {e}")
        finally:
            connection.execute(text(f"DROP TABLE IF EXISTS {temp_table_name}"))


def process_anc_register_data():
    site_id = process_site_information_data()
    anc_register_query = "SELECT anc_id,date AS registered_date,site_id,anc_number,art_initiated,art_number,edd,hiv_status,lnmp,person_id FROM report.anc_register"
    anc_register_df = pd.read_sql(anc_register_query, source_engine)

    # Coerce date format
    anc_register_df['registered_date'] = coerce_date_format(anc_register_df['registered_date'])
    anc_register_df['edd'] = coerce_date_format(anc_register_df['edd'])
    anc_register_df['lnmp'] = coerce_date_format(anc_register_df['lnmp'])

    # Plug all empty site id values
    anc_register_df['site_id'] = anc_register_df['site_id'].fillna(site_id)

    # Create table and insert data
    create_table_from_df(target_engine, anc_register_df, 'anc_register', ['anc_id', 'person_id'])
    insert_data_ignore_duplicates(target_engine, anc_register_df, 'anc_register', ['anc_id', 'person_id'])

def process_anc_booked_register_data():
    site_id = process_site_information_data()
    anc_booked_register_query = "SELECT anc_id,date AS booked_date,gestational_age,patient_id,person_id,trimester FROM report.anc_booked_register"
    anc_booked_register_df = pd.read_sql(anc_booked_register_query, source_engine)
    anc_booked_register_df['site_id'] = site_id

    # Coerce date format
    anc_booked_register_df['booked_date'] = coerce_date_format(anc_booked_register_df['booked_date'])

    # Create table and insert data
    create_table_from_df(target_engine, anc_booked_register_df, 'anc_booked_register', ['anc_id', 'patient_id'])
    insert_data_ignore_duplicates(target_engine, anc_booked_register_df, 'anc_booked_register', ['anc_id', 'patient_id'])

def process_hts_register_data():
    site_id = process_site_information_data()
    hiv_query = "SELECT *,`date` AS hts_date FROM report.hts_register"
    hts_register_df = pd.read_sql(hiv_query, source_engine, dtype={
        'already_on_art' : 'bool',
        'already_positive' : 'bool',
        'client_assisted_self_test' : 'bool',
        'client_tested_on_site' : 'bool',
        'couple' : 'bool',
        'group_education' : 'bool',
        'lactating' : 'bool',
        'opt' : 'bool',
        'post_test_counselling' : 'bool',
        'pre_test_counselling' : 'bool',
        'pregnant' : 'bool',
        'results_issued' : 'bool',
        'retest' : 'bool'
        })
    
    # Coerce date format
    hts_register_df['hts_date'] = coerce_date_format(hts_register_df['hts_date'])
    hts_register_df['time'] = coerce_date_format(hts_register_df['time'])

    # Plug all empty site id values
    hts_register_df['site_id'] = hts_register_df['site_id'].fillna(site_id)

    # Create table and insert data
    create_table_from_df(target_engine, hts_register_df, 'hts_register', ['hts_id', 'hts_date'])
    insert_data_ignore_duplicates(target_engine, hts_register_df, 'hts_register', ['hts_id', 'hts_date'])

def process_hiv_positive_person_data():
    site_id = process_site_information_data()
    hiv_positive_person_query = "SELECT *,`result` AS hiv_positive_test_result FROM report.hiv_positive_person"
    hiv_positive_person_df = pd.read_sql(hiv_positive_person_query, source_engine, dtype={
        'month' : 'float64',
        'year' : 'float64'
        })
    hiv_positive_person_df['site_id'] = site_id

    # Coerce date format
    hiv_positive_person_df['birth_date'] = coerce_date_format(hiv_positive_person_df['birth_date'])
    hiv_positive_person_df['result_date'] = coerce_date_format(hiv_positive_person_df['result_date'])
    hiv_positive_person_df['visit_date'] = coerce_date_format(hiv_positive_person_df['visit_date'])

    # Fill NaNs  with 0 or an appropriate default value
    hiv_positive_person_df['month'].fillna(0, inplace=True)
    hiv_positive_person_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    hiv_positive_person_df['month'] = hiv_positive_person_df['month'].astype('int64')
    hiv_positive_person_df['year'] = hiv_positive_person_df['year'].astype('int64')
    
    # Create table and insert data
    create_table_from_df(target_engine, hiv_positive_person_df, 'hiv_positive_person', ['investigation_order_id', 'person_id'])
    insert_data_ignore_duplicates(target_engine, hiv_positive_person_df, 'hiv_positive_person', ['investigation_order_id', 'person_id'])

def process_hts_screening_register_data():
    site_id = process_site_information_data()
    hts_screening_query = "SELECT *,`result` AS hts_screening_result FROM report.hts_screening_register"
    hts_screening_df = pd.read_sql(hts_screening_query, source_engine, dtype={
        'art' : 'bool',
        'been_on_prep' : 'bool',
        'tested_before' : 'bool'
        })
    hts_screening_df['site_id'] = site_id

    # Coerce date format
    hts_screening_df['date_last_tested'] = coerce_date_format(hts_screening_df['date_last_tested'])

    # Create table and insert data
    create_table_from_df(target_engine, hts_screening_df, 'hts_screening_register', ['hts_screening_id', 'patient_id'])
    insert_data_ignore_duplicates(target_engine, hts_screening_df, 'hts_screening_register', ['hts_screening_id', 'patient_id'])

def process_hts_register_test_data():
    site_id = process_site_information_data()
    hts_test_query = "SELECT order_test_id, hts_id, test_kit, time as time_tested, result as hts_register_test_result FROM report.hts_register_test"
    hts_test_df = pd.read_sql(hts_test_query, source_engine)
    hts_test_df['site_id'] = site_id

    # Coerce date format
    hts_test_df['time_tested'] = coerce_date_format(hts_test_df['time_tested'])

    # Create table and insert data
    create_table_from_df(target_engine, hts_test_df, 'hts_register_test', ['order_test_id', 'hts_id'])
    insert_data_ignore_duplicates(target_engine, hts_test_df, 'hts_register_test', ['order_test_id', 'hts_id'])

def process_art_register_data():
   site_id = process_site_information_data()
   art_query = "SELECT * FROM report.art_register"
   art_df = pd.read_sql(art_query, source_engine, dtype={
        'consent_to_personal_follow_up' : 'bool',
        'cyanosis' : 'bool',
        'enlarged_lymph_node' : 'bool',
        'jaundice' : 'bool',
        'month' : 'float64',
        'pallor' : 'bool',
        'year' : 'float64'
        })
   
   # Coerce date format
   art_df['birth_date'] = coerce_date_format(art_df['birth_date'])
   art_df['date'] = coerce_date_format(art_df['date'])
   art_df['date_enrolled'] = coerce_date_format(art_df['date_enrolled'])
   art_df['date_of_hiv_test'] = coerce_date_format(art_df['date_of_hiv_test'])

   # Fill NaNs  with 0 or an appropriate default value
   art_df['month'].fillna(0, inplace=True)
   art_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
   art_df['month'] = art_df['month'].astype('int64')
   art_df['year'] = art_df['year'].astype('int64')

   # Plug all empty site id values
   art_df['site_id'] = art_df['site_id'].fillna(site_id)
   
   # Create table and insert data
   create_table_from_df(target_engine, art_df, 'art_register', ['art_id', 'person_id'])
   insert_data_ignore_duplicates(target_engine, art_df, 'art_register', ['art_id', 'person_id'])

# Extract, transform, and load data for ART transfer in register
def process_art_transfer_in_register_data():
    site_id = process_site_information_data()
    art_transfer_in_query = "SELECT id, art_id, date_of_transfer_in, transfer_facility_id FROM report.art_transfer_in_register"
    art_transfer_in_df = pd.read_sql(art_transfer_in_query, source_engine)
    art_transfer_in_df['site_id'] = site_id

    # Coerce date format
    art_transfer_in_df['date_of_transfer_in'] = coerce_date_format(art_transfer_in_df['date_of_transfer_in'])

    # Create table and insert data
    create_table_from_df(target_engine, art_transfer_in_df, 'art_transfer_in_register', ['id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_transfer_in_df, 'art_transfer_in_register', ['id', 'art_id'])

# Extract, transform, and load data for ART transfer out register
def process_art_transfer_out_register_data():
    site_id = process_site_information_data()
    art_transfer_out_query = "SELECT art_transfer_out_register_id, art_id, transfer_out_date, transfer_facility_id, transfer_reason FROM report.art_transfer_out_register"
    art_transfer_out_df = pd.read_sql(art_transfer_out_query, source_engine)
    art_transfer_out_df['site_id'] = site_id

    # Coerce date format
    art_transfer_out_df['transfer_out_date'] = coerce_date_format(art_transfer_out_df['transfer_out_date'])

    # Create table and insert data
    create_table_from_df(target_engine, art_transfer_out_df, 'art_transfer_out_register', ['art_transfer_out_register_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_transfer_out_df, 'art_transfer_out_register', ['art_transfer_out_register_id', 'art_id'])

# Extract, transform, and load data for ART visits register
def process_art_visit_register_data():
    site_id = process_site_information_data()
    art_visit_query = "SELECT art_visit_id, site_id, patient_id, art_id, date AS visit_date, visit_status, visit_type, functional_status, family_planning_status, lactating_status FROM report.art_visit_register"
    art_visit_df = pd.read_sql(art_visit_query, source_engine)

    # Coerce date format
    art_visit_df['visit_date'] = coerce_date_format(art_visit_df['visit_date'])

    # Plug all empty site id values
    art_visit_df['site_id'] = art_visit_df['site_id'].fillna(site_id)

    # Create table and insert data
    create_table_from_df(target_engine, art_visit_df, 'art_visit_register', ['art_visit_id', 'patient_id'])
    insert_data_ignore_duplicates(target_engine, art_visit_df, 'art_visit_register', ['art_visit_id', 'patient_id'])

# Extract, transform, and load data for ART WHO stage register
def process_art_who_stage_register_data():
    site_id = process_site_information_data()
    art_who_stage_query = "SELECT art_stage_id, art_register_id as art_id, date as visit_date, follow_up_status as follow_up_status_at_who_stage, stage as who_stage FROM report.art_who_stage_register"
    art_who_stage_df = pd.read_sql(art_who_stage_query, source_engine)
    art_who_stage_df['site_id'] = site_id

    # Coerce date format
    art_who_stage_df['visit_date'] = coerce_date_format(art_who_stage_df['visit_date'])

    # Create table and insert data
    create_table_from_df(target_engine, art_who_stage_df, 'art_who_stage_register', ['art_stage_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_who_stage_df, 'art_who_stage_register', ['art_stage_id', 'art_id'])

# Extract, transform, and load data for ART IPT status register
def process_art_ipt_status_register_data():
    site_id = process_site_information_data()
    art_tpt_status_query = "SELECT art_ipt_status_id, art_register_id as art_id, date as visit_date, status as tpt_status FROM report.art_ipt_status_register"
    art_tpt_status_df = pd.read_sql(art_tpt_status_query, source_engine)
    art_tpt_status_df['site_id'] = site_id

    # Coerce date format
    art_tpt_status_df['visit_date'] = coerce_date_format(art_tpt_status_df['visit_date'])

    # Create table and insert data
    create_table_from_df(target_engine, art_tpt_status_df, 'art_ipt_status_register', ['art_ipt_status_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_tpt_status_df, 'art_ipt_status_register', ['art_ipt_status_id', 'art_id'])

# Extract, transform, and load data for ART current status register
def process_art_current_status_register_data():
    site_id = process_site_information_data()
    art_current_status_query = "SELECT art_status_id, art_register_id as art_id, date AS visit_date, adverse_event_status, reason, reason_for_regimen_substitution, regimen, regimen_from, regimen_line_name, state as arv_status, treatment_failure_reason FROM report.art_current_status_register"
    art_current_status_df = pd.read_sql(art_current_status_query, source_engine)
    art_current_status_df['site_id'] = site_id

    # Coerce date format
    art_current_status_df['visit_date'] = coerce_date_format(art_current_status_df['visit_date'])

    # Create table and insert data
    create_table_from_df(target_engine, art_current_status_df, 'art_current_status_register', ['art_status_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_current_status_df, 'art_current_status_register', ['art_status_id', 'art_id'])

# Extract, transform, and load data for Viral Load
def process_viral_load_data():
    site_id = process_site_information_data()
    viral_load_query = "SELECT * FROM report.viral_load_investigation_register"
    viral_load_df = pd.read_sql(viral_load_query, source_engine, dtype={
        'result_issued' : 'bool',
        'month' : 'float64',
        'year' : 'float64'
        })
    viral_load_df['site_id'] = site_id

    # Coerce date format
    viral_load_df['birth_date'] = coerce_date_format(viral_load_df['birth_date'])
    viral_load_df['date'] = coerce_date_format(viral_load_df['date'])
    viral_load_df['result_date'] = coerce_date_format(viral_load_df['result_date'])

    # Fill NaNs  with 0 or an appropriate default value
    viral_load_df['month'].fillna(0, inplace=True)
    viral_load_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    viral_load_df['month'] = viral_load_df['month'].astype('int64')
    viral_load_df['year'] = viral_load_df['year'].astype('int64')

    # Create table and insert data
    create_table_from_df(target_engine, viral_load_df, 'viral_load_investigation', ['laboratory_investigation_id', 'date'])
    insert_data_ignore_duplicates(target_engine, viral_load_df, 'viral_load_investigation', ['laboratory_investigation_id', 'date'])

# Extract, transform, and load data for TB Screening
def process_tpt_screening_data():
    site_id = process_site_information_data()
    tpt_screening_query = "SELECT * FROM report.tpt_screening_report"
    tpt_screening_df = pd.read_sql(tpt_screening_query, source_engine, dtype={
        'completed_ipt_in_the_last_three_years' : 'bool',
        'eligible' : 'bool',
        'heavy_alcohol_use' : 'bool',
        'patient_currently_on_tb_treatment' : 'bool',
        'severe_peripheral_neuropathy' : 'bool',
        'sign_and_symptoms_of_active_tb' : 'bool',
        'signs_of_active_liver_disease' : 'bool'
        })
    
    # Coerce date format
    tpt_screening_df['date'] = coerce_date_format(tpt_screening_df['date'])

    # Plug all empty site id values
    tpt_screening_df['site_id'] = tpt_screening_df['site_id'].fillna(site_id)

    # Create table and insert data
    create_table_from_df(target_engine, tpt_screening_df, 'tpt_screening', ['patient_tpt_screening_id', 'date'])
    insert_data_ignore_duplicates(target_engine, tpt_screening_df, 'tpt_screening', ['patient_tpt_screening_id', 'date'])

# Extract, transform, and load data for ANC Visits
def process_anc_visit_data():
    site_id = process_site_information_data()
    anc_visit_query = "SELECT * FROM report.anc_visit_register"
    anc_visit_df = pd.read_sql(anc_visit_query, source_engine, dtype={
        'calcium_supplement' : 'bool',
        'history_visit' : 'bool',
        'protein_supplement' : 'bool',
        'visit_number' : 'float64'
        })
    
    # Coerce date format
    anc_visit_df['date'] = coerce_date_format(anc_visit_df['date'])

    # Fill NaNs in 'visit_number' with 0 or an appropriate default value
    anc_visit_df['visit_number'].fillna(0, inplace=True)
    
    # Convert 'visit_number' to int64
    anc_visit_df['visit_number'] = anc_visit_df['visit_number'].astype('int64')

    # Plug all empty site id values
    anc_visit_df['site_id'] = anc_visit_df['site_id'].fillna(site_id)
    
    # Create table and insert data
    create_table_from_df(target_engine, anc_visit_df, 'anc_visit', ['anc_visit_id', 'anc_id'])
    insert_data_ignore_duplicates(target_engine, anc_visit_df, 'anc_visit', ['anc_visit_id', 'anc_id'])

# Extract, transform, and load data for ART Appointments
def process_art_appointment_data():
    site_id = process_site_information_data()
    art_appointment_query = "SELECT * FROM report.art_appointment_register"
    art_appointment_df = pd.read_sql(art_appointment_query, source_engine, dtype={
        'month' : 'float64',
        'year' : 'float64'
        })
    art_appointment_df['site_id'] = site_id

    # Coerce date format
    art_appointment_df['appointment_outcome_date'] = coerce_date_format(art_appointment_df['appointment_outcome_date'])
    art_appointment_df['date'] = coerce_date_format(art_appointment_df['date'])
    art_appointment_df['date_appointment_given'] = coerce_date_format(art_appointment_df['date_appointment_given'])
    art_appointment_df['followup_date'] = coerce_date_format(art_appointment_df['followup_date'])

    # Fill NaNs  with 0 or an appropriate default value
    art_appointment_df['month'].fillna(0, inplace=True)
    art_appointment_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    art_appointment_df['month'] = art_appointment_df['month'].astype('int64')
    art_appointment_df['year'] = art_appointment_df['year'].astype('int64')

    # Create table and insert data
    create_table_from_df(target_engine, art_appointment_df, 'art_appointment', ['art_appointment_register_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, art_appointment_df, 'art_appointment', ['art_appointment_register_id', 'art_id'])

# Extract, transform, and load data for CBS
def process_cbs_data():
    site_id = process_site_information_data()
    cbs_query = "SELECT * FROM report.cbs_register"
    cbs_df = pd.read_sql(cbs_query, source_engine, dtype={
        'age' : 'float64',
        'biological_mother_alive' : 'bool',
        'birth_weight' : 'float64',
        'breast_feeding' : 'bool',
        'cd4count' : 'float64',
        'currently_breastfeeding_infant' : 'bool',
        'gestation' : 'float64',
        'gestation_atbooking' : 'float64',
        'not_pregnant_orbreastfeeding' : 'bool',
        'number_of_anc_visits' : 'float64',
        'offline' : 'bool',
        'parity_at_booking' : 'float64',
        'pregnant' : 'bool',
        'specify_gestation_atdelivery' : 'float64',
        'submitted' : 'bool'
        })
    
    # Coerce date format
    cbs_df['date_of_diagnosis'] = coerce_date_format(cbs_df['date_of_diagnosis'])
    cbs_df['date_of_initiation'] = coerce_date_format(cbs_df['date_of_initiation'])
    cbs_df['date_of_most_recent_hiv_result'] = coerce_date_format(cbs_df['date_of_most_recent_hiv_result'])
    cbs_df['time'] = coerce_date_format(cbs_df['time'])
    cbs_df['timing_of_hiv_diagnosis'] = coerce_date_format(cbs_df['timing_of_hiv_diagnosis'])

    # Fill NaNs  with 0 or an appropriate default value
    cbs_df['age'].fillna(0, inplace=True)
    cbs_df['birth_weight'].fillna(0, inplace=True)
    cbs_df['cd4count'].fillna(0, inplace=True)
    cbs_df['gestation'].fillna(0, inplace=True)
    cbs_df['gestation_atbooking'].fillna(0, inplace=True)
    cbs_df['number_of_anc_visits'].fillna(0, inplace=True)
    cbs_df['parity_at_booking'].fillna(0, inplace=True)
    cbs_df['specify_gestation_atdelivery'].fillna(0, inplace=True)
    
    # Convert  to int64
    cbs_df['age'] = cbs_df['age'].astype('int64')
    cbs_df['birth_weight'] = cbs_df['birth_weight'].astype('int64')
    cbs_df['cd4count'] = cbs_df['cd4count'].astype('int64')
    cbs_df['gestation'] = cbs_df['gestation'].astype('int64')
    cbs_df['gestation_atbooking'] = cbs_df['gestation_atbooking'].astype('int64')
    cbs_df['number_of_anc_visits'] = cbs_df['number_of_anc_visits'].astype('int64')
    cbs_df['parity_at_booking'] = cbs_df['parity_at_booking'].astype('int64')
    cbs_df['specify_gestation_atdelivery'] = cbs_df['specify_gestation_atdelivery'].astype('int64')

    # Plug all empty site id values
    cbs_df['site_id'] = cbs_df['site_id'].fillna(site_id)

    # Create table and insert data
    create_table_from_df(target_engine, cbs_df, 'cbs', ['person_id', 'site_id'])
    insert_data_ignore_duplicates(target_engine, cbs_df, 'cbs', ['person_id', 'site_id'])

# Extract, transform, and load data for DSD Group
def process_art_dsd_group_data():
    site_id = process_site_information_data()
    dsd_group_query = "SELECT * FROM report.art_dsd_group_report"
    dsd_group_df = pd.read_sql(dsd_group_query, source_engine, dtype={
        'month' : 'float64',
        'year' : 'float64'
        })
    dsd_group_df['site_id'] = site_id

    # Coerce date format
    dsd_group_df['date'] = coerce_date_format(dsd_group_df['date'])

    # Fill NaNs  with 0 or an appropriate default value
    dsd_group_df['month'].fillna(0, inplace=True)
    dsd_group_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    dsd_group_df['month'] = dsd_group_df['month'].astype('int64')
    dsd_group_df['year'] = dsd_group_df['year'].astype('int64')

    # Create table and insert data
    create_table_from_df(target_engine, dsd_group_df, 'art_dsd_group', ['art_dsd_group_id', 'date'])
    insert_data_ignore_duplicates(target_engine, dsd_group_df, 'art_dsd_group', ['art_dsd_group_id', 'date'])

# Extract, transform, and load data for DSD Client
def process_art_dsd_client_data():
    site_id = process_site_information_data()
    dsd_client_query = "SELECT * FROM report.art_dsd_group_client_report"
    dsd_client_df = pd.read_sql(dsd_client_query, source_engine)
    dsd_client_df['site_id'] = site_id
    dsd_client_df['date_joined'] = coerce_date_format(dsd_client_df['date_joined'])
    dsd_client_df['date_left'] = coerce_date_format(dsd_client_df['date_left'])
    create_table_from_df(target_engine, dsd_client_df, 'art_dsd_group_client', ['art_dsd_group_id', 'art_id'])
    insert_data_ignore_duplicates(target_engine, dsd_client_df, 'art_dsd_group_client', ['art_dsd_group_id', 'art_id'])

# Extract, transform, and load data for DSD Appointments
def process_art_dsd_appointment_data():
    site_id = process_site_information_data()
    dsd_group_appointment_query = "SELECT * FROM report.art_dsd_group_appointment_report"
    dsd_group_appointment_df = pd.read_sql(dsd_group_appointment_query, source_engine, dtype={
        'month' : 'float64',
        'year' : 'float64'
        })
    dsd_group_appointment_df['site_id'] = site_id

    # Coerce date format
    dsd_group_appointment_df['appointment_date'] = coerce_date_format(dsd_group_appointment_df['appointment_date'])
    dsd_group_appointment_df['visit_date'] = coerce_date_format(dsd_group_appointment_df['visit_date'])

    # Fill NaNs  with 0 or an appropriate default value
    dsd_group_appointment_df['month'].fillna(0, inplace=True)
    dsd_group_appointment_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    dsd_group_appointment_df['month'] = dsd_group_appointment_df['month'].astype('int64')
    dsd_group_appointment_df['year'] = dsd_group_appointment_df['year'].astype('int64')

    # Create table and insert data
    create_table_from_df(target_engine, dsd_group_appointment_df, 'art_dsd_group_appointment', ['id', 'appointment_date'])
    insert_data_ignore_duplicates(target_engine, dsd_group_appointment_df, 'art_dsd_group_appointment', ['id', 'appointment_date'])

# Extract, transform, and load data for ART Monitoring
def process_art_monitoring_data():
    site_id = process_site_information_data()
    art_monitoring_query = "SELECT * FROM report.art_monitoring"
    art_monitoring_df = pd.read_sql(art_monitoring_query, source_engine, dtype={
        'month' : 'float64',
        'year' : 'float64'
        })
    art_monitoring_df['site_id'] = site_id

    # Coerce date format
    art_monitoring_df['birth_date'] = coerce_date_format(art_monitoring_df['birth_date'])
    art_monitoring_df['date'] = coerce_date_format(art_monitoring_df['date'])
    art_monitoring_df['date_enrolled'] = coerce_date_format(art_monitoring_df['date_enrolled'])
    art_monitoring_df['date_of_hiv_test'] = coerce_date_format(art_monitoring_df['date_of_hiv_test'])

    # Fill NaNs  with 0 or an appropriate default value
    art_monitoring_df['month'].fillna(0, inplace=True)
    art_monitoring_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    art_monitoring_df['month'] = art_monitoring_df['month'].astype('int64')
    art_monitoring_df['year'] = art_monitoring_df['year'].astype('int64')

    # Create table and insert data
    create_table_from_df(target_engine, art_monitoring_df, 'art_monitoring', ['art_id', 'person_id'])
    insert_data_ignore_duplicates(target_engine, art_monitoring_df, 'art_monitoring', ['art_id', 'person_id'])

# Extract, transform, and load data for PREP Register
def process_prep_register_data():
    site_id = process_site_information_data()
    prep_register_query = "SELECT * FROM report.prep_register"
    prep_register_df = pd.read_sql(prep_register_query, source_engine)
    
    # Define dtype mappings and check for column existence
    dtype_mappings = {
        'client_agree_prep_initiation': 'bool',
        'client_eligible_or_offered_prep': 'bool',
        'client_first_initiation_this_year': 'bool',
        'risk_assessment_done': 'bool',
        'client_eligible_for_prep': 'bool',
        'client_first_time_on_prep': 'bool',
        'client_offered_prep': 'bool',
        'is_sero_conversion': 'bool'
    }
    
    for col in list(dtype_mappings.keys()):
        if col not in prep_register_df.columns:
            del dtype_mappings[col]
    
    prep_register_df = pd.read_sql(prep_register_query, source_engine, dtype=dtype_mappings)
    prep_register_df['site_id'] = site_id

    # Coerce date format
    prep_register_df['date'] = coerce_date_format(prep_register_df['date'])
    prep_register_df['date_testedhiv'] = coerce_date_format(prep_register_df['date_testedhiv'])
    prep_register_df['initiation_date'] = coerce_date_format(prep_register_df['initiation_date'])
    prep_register_df['withdrawal_date'] = coerce_date_format(prep_register_df['withdrawal_date'])
    prep_register_df['consent_date'] = coerce_date_format(prep_register_df['consent_date'])
    prep_register_df['last_date_of_taking_prep'] = coerce_date_format(prep_register_df['last_date_of_taking_prep'])
    prep_register_df['previous_prep_initiation_date'] = coerce_date_format(prep_register_df['previous_prep_initiation_date'])
    prep_register_df['sero_conversion_date'] = coerce_date_format(prep_register_df['sero_conversion_date'])

    # Create table and insert data
    create_table_from_df(target_engine, prep_register_df, 'prep_register', ['prep_id', 'person_id'])
    insert_data_ignore_duplicates(target_engine, prep_register_df, 'prep_register', ['prep_id', 'person_id'])

# Extract, transform, and load data for STI Register
def process_sti_register_data():
    site_id = process_site_information_data()
    sti_register_query = "SELECT * FROM report.sti_register"
    sti_register_df = pd.read_sql(sti_register_query, source_engine, dtype={
        'condom_information_given' : 'bool',
        'condoms_issued' : 'bool',
        'consent_to_list_contacts' : 'bool',
        'recent_sexual_exposure' : 'bool',
        'repeat_sti' : 'bool',
        'slips_issued' : 'bool',
        'slips_received' : 'bool',
        'tested_for_hiv' : 'bool',
        'tested_for_syphilis' : 'bool',
        'contact' : 'bool',
        'month' : 'float64',
        'year' : 'float64'
        })
    
    sti_register_df['site_id'] = site_id

    # Coerce date format
    sti_register_df['date'] = coerce_date_format(sti_register_df['date'])
    
    # Fill NaNs  with 0 or an appropriate default value
    sti_register_df['month'].fillna(0, inplace=True)
    sti_register_df['year'].fillna(0, inplace=True)
    
    # Convert  to int64
    sti_register_df['month'] = sti_register_df['month'].astype('int64')
    sti_register_df['year'] = sti_register_df['year'].astype('int64')

    # Create table and insert data
    create_table_from_df(target_engine, sti_register_df, 'sti_register', ['patient_sti_id', 'patient_id'])
    insert_data_ignore_duplicates(target_engine, sti_register_df, 'sti_register', ['patient_sti_id', 'patient_id'])

# Extract, transform, and load data for Demographic Data
def process_person_demographic_data():
    site_id = process_site_information_data()
    person_demographic_query = "SELECT person_id, birthdate, country_of_birth, education, marital, nationality, occupation, religion, self_identified_gender, sex FROM report.person_demographic"
    person_demographic_df = pd.read_sql(person_demographic_query, source_engine)
    
    person_demographic_df['site_id'] = site_id

    # Coerce date format
    person_demographic_df['birthdate'] = coerce_date_format(person_demographic_df['birthdate'])
    

    # Create table and insert data
    create_table_from_df(target_engine, person_demographic_df, 'person_demographic', ['person_id', 'site_id'])
    insert_data_ignore_duplicates(target_engine, person_demographic_df, 'person_demographic', ['person_id', 'site_id'])

def process_all_data():
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
    process_art_monitoring_data()
    process_prep_register_data()
    process_sti_register_data()
    process_person_demographic_data()

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


if __name__ == "__main__":
    main()
