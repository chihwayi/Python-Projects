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
container_name = "mysql"

def get_metadata_value(metadata, key):
    """Returns the value for a given key from the metadata string."""
    match = re.search(rf"<string>{key}</string><string>(.*?)</string>", metadata)
    return match.group(1) if match else None

def process_site_information_data():
    metadata_query = "SELECT meta_data FROM mrs.domain_event_entry WHERE time_stamp = (SELECT MAX(time_stamp) FROM mrs.domain_event_entry)"
    metadata_df = pd.read_sql(metadata_query, source_engine)
    if not metadata_df.empty:
        meta_data = metadata_df['meta_data'].iloc[0].decode("utf-8")
        site_id = get_metadata_value(meta_data, 'siteId')
        return site_id

def create_database_if_not_exists(config):
    connection = pymysql.connect(user=config['user'], password=config['password'], host=config['host'])
    cursor = connection.cursor()
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS {config['database']}")
    connection.close()

def create_table_from_df(engine, df, table_name, primary_key_columns):
    mysql_data_types = {
        'int64': 'INT',
        'float64': 'FLOAT',
        'object': 'VARCHAR(255)',
        'datetime64[ns]': 'DATE'
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

def write_processed_file_to_backup(file_name):
    backup_file_path = os.path.join(backup_folder, 'processed_files.txt')
    with open(backup_file_path, 'a') as file:
        file.write(os.path.abspath(file_name) + '\n')

def load_sql_file_into_mysql(sql_file, container_name, db_name, root_password):
    create_database_if_not_exists(target_db_config)
    if os.path.abspath(sql_file) in read_processed_files(backup_folder):
        print(f"{sql_file} has been processed. Skipping.")
        return
    subprocess.run(["docker", "cp", sql_file, f"{container_name}:/tmp/backup.sql"], check=True)
    env = os.environ.copy()
    env['MYSQL_PWD'] = root_password
    command = f"mysql --binary-mode=1 -u root -p{root_password} {db_name} < /tmp/backup.sql"
    subprocess.run(["docker", "exec", "-i", container_name, "sh", "-c", command], check=True, env=env)
    write_processed_file_to_backup(sql_file)

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

def process_data(query, table_name, primary_key_columns, site_id_required=False):
    if site_id_required:
        site_id = process_site_information_data()
    else:
        site_id = None
    df = pd.read_sql(query, source_engine)
    if site_id:
        df['site_id'] = site_id
    create_table_from_df(target_engine, df, table_name, primary_key_columns)
    insert_data_ignore_duplicates(target_engine, df, table_name, primary_key_columns)

def main():
    create_database_if_not_exists(target_db_config)
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

    queries = {
        'anc_register': ("SELECT anc_id, date AS registered_date, site_id, anc_number, art_initiated, art_number, edd, hiv_status, lnmp, person_id FROM report.anc_register", ['anc_id', 'registered_date']),
        'anc_booked_register': ("SELECT anc_id, date AS booked_date, gestational_age, patient_id, person_id, trimester FROM report.anc_booked_register", ['anc_id', 'booked_date']),
        'hts_register': ("SELECT *, `date` AS hts_date FROM report.hts_register", ['hts_id', 'hts_date']),
        'hiv_positive_person': ("SELECT *, `result` AS hiv_positive_test_result FROM report.hiv_positive_person", ['investigation_order_id', 'visit_date']),
        'hts_screening_register': ("SELECT *, `result` AS hts_screening_result FROM report.hts_screening_register", ['hts_screening_id', 'patient_id']),
        'hts_register_test': ("SELECT order_test_id, hts_id, test_kit, time as time_tested, result as hts_register_test_result FROM report.hts_register_test", ['order_test_id', 'hts_id']),
        'art_register': ("SELECT * FROM report.art_register", ['art_id', 'person_id']),
        'art_register_followup': ("SELECT * FROM report.art_register_followup", ['visit_id', 'person_id']),
        'art_transfer_in_register': ("SELECT id, art_id, date_of_transfer_in, transfer_facility_id FROM report.art_transfer_in_register", ['id', 'art_id']),
        'art_transfer_out_register': ("SELECT art_transfer_out_register_id, art_id, transfer_out_date, transfer_facility_id, transfer_reason FROM report.art_transfer_out_register", ['art_transfer_out_register_id', 'art_id']),
        'art_visit_register': ("SELECT art_visit_id, site_id, patient_id, art_id, date AS visit_date, visit_status, visit_type, functional_status, family_planning_status, lactating_status FROM report.art_visit_register", ['art_visit_id', 'visit_date']),
        'art_who_stage_register': ("SELECT art_stage_id, art_register_id as art_id, date as visit_date, follow_up_status as follow_up_status_at_who_stage, stage as who_stage FROM report.art_who_stage_register", ['art_stage_id', 'visit_date']),
        'art_ipt_status_register': ("SELECT art_ipt_status_id, art_register_id as art_id, date as visit_date, status as tpt_status FROM report.art_ipt_status_register", ['art_ipt_status_id', 'visit_date']),
        'art_current_status_register': ("SELECT art_status_id, art_register_id as art_id, date AS visit_date, adverse_event_status, reason, reason_for_regimen_substitution, regimen, regimen_from, regimen_line_name, state as arv_status, treatment_failure_reason FROM report.art_current_status_register", ['art_status_id', 'visit_date']),
        'viral_load_register': ("SELECT viral_load_id, patient_id, date as visit_date, result, test_type, time as time_tested FROM report.viral_load_register", ['viral_load_id', 'visit_date'])
    }

    for table_name, (query, primary_keys) in queries.items():
        process_data(query, table_name, primary_keys, site_id_required=True)
        print(f"{table_name} processed successfully.")

if __name__ == "__main__":
    main()
