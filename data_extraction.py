import os
import pandas as pd
from datetime import datetime
import mysql.connector
from pathlib import Path
from sqlalchemy import create_engine

def connect_to_db():
    """Establish and return a database connection."""
    return mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="root",
        database="ctc2data",
        auth_plugin="mysql_native_password",
        use_unicode=True, 
        charset="utf8"
    )

def get_sqlalchemy_engine():
    """Create and return a SQLAlchemy engine for pandas."""
    return create_engine("mysql+pymysql://root:root@localhost/ctc2data")

def get_facility_info(engine):
    """Get facility information and return formatted data."""
    facility_query = """
    SELECT 
        c.regioncode, c.districtcode, c.facilitycode
    FROM 
        tblconfig c
    """
    
    # Basic facility info
    fac = pd.read_sql(facility_query, engine)
    
    # Try to get additional facility details if available
    try:
        facility_details_query = """
        SELECT 
            c.regioncode, c.districtcode, c.facilitycode,
            r.Region, d.District, f.FacilityName
        FROM 
            tblconfig c
        JOIN 
            tblsetupregions r ON c.regioncode = r.RegionCode
        JOIN 
            tblsetupdistricts d ON c.districtcode = d.DistrictCode AND r.RegionCode = d.RegionCode
        JOIN 
            facility f ON c.facilitycode = f.FacilityCode AND c.districtcode = f.DistrictID 
            AND d.DistrictCode = f.DistrictID AND f.ProvinceID = r.RegionCode
        """
        detailed_info = pd.read_sql(facility_details_query, engine)
        if not detailed_info.empty:
            return detailed_info
    except:
        # Fall back to basic info if the detailed query fails
        pass
    
    return fac

def add_facility_info(df, facility_info):
    """Add facility information to a dataframe."""
    if df.empty:
        return df
    
    df = df.copy()
    n = df.shape[0]
    
    # Add facility codes
    df['Facilitycode'] = facility_info['facilitycode'].iloc[0]
    df['Districtcode'] = facility_info['districtcode'].iloc[0]
    df['Provincecode'] = facility_info['regioncode'].iloc[0]
    
    # Add facility names if available
    if 'Region' in facility_info.columns:
        df['FacilityName'] = facility_info['FacilityName'].iloc[0]
        df['District'] = facility_info['District'].iloc[0]
        df['Province'] = facility_info['Region'].iloc[0]
    
    return df

def process_tb_screening(engine, facility_info):
    """Process TB screening data and export to CSV."""
    print("Processing TB screening data...")
    
    # Get patient data
    patients = pd.read_sql("SELECT PatientID, DateOfBirth, Sex FROM tblpatients", engine)
    
    # Get visit data with TB and ARV status
    visits_query = """
    SELECT 
        v.PatientID, p.DateOfBirth, p.Sex, v.VisitDate, v.VisitTypeCode,
        tb.TBStatusDescription, arv.ARVStatusDescription
    FROM 
        tblvisits v
    JOIN 
        tblpatients p ON v.PatientID = p.PatientID
    JOIN 
        tblsetuptbstatus tb ON v.TBStatusCode = tb.TBStatusCode
    JOIN 
        tblsetuparvstatuscodes arv ON v.ARVStatusCode = arv.ARVStatusCode
    """
    visits = pd.read_sql(visits_query, engine)
    
    # Get medication data
    med_query = """
    SELECT 
        PatientID, VisitDate, DrugTypeID 
    FROM 
        tblmedication 
    WHERE 
        DrugTypeID IN ('IPT', 'FLU', 'TPT')
    """
    medications = pd.read_sql(med_query, engine)
    
    # Merge data
    data_combined = pd.merge(visits, medications, how='left', on=['PatientID', 'VisitDate'])
    
    # Process dates and calculate age
    data_combined['Date'] = pd.to_datetime(data_combined['VisitDate'], errors='coerce')
    data_combined['Period'] = pd.DatetimeIndex(data_combined['Date']).month
    data_combined.drop('Date', axis=1, inplace=True)
    
    today = datetime.today()
    data_combined['Age'] = data_combined['DateOfBirth'].apply(
        lambda x: today.year - x.year - ((today.month, today.day) < (x.month, x.day))
    )
    
    # Add facility information
    data_combined = add_facility_info(data_combined, facility_info)
    
    # Determine facility name for file naming
    if 'FacilityName' in facility_info.columns:
        facility_name = facility_info['FacilityName'].iloc[0]
    else:
        # Create a combined code if no name available
        facility_name = f"{facility_info['regioncode'].iloc[0]}_{facility_info['districtcode'].iloc[0]}_{facility_info['facilitycode'].iloc[0]}"
    
    sanitized_name = str(facility_name)[:45].replace('/', '_')
    
    # Export to CSV
    output_dir = Path('/home/devoop/Documents/Datasets/tb screening')
    output_dir.mkdir(exist_ok=True)
    
    output_file = output_dir / f"{sanitized_name}.csv"
    data_combined.to_csv(output_file, encoding='utf-8', index=False)
    print(f"TB screening data exported to {output_file}")
    
    return sanitized_name

def process_retention(engine, facility_info, facility_name):
    """Process retention data and export to Stata format."""
    print("Processing retention data...")
    
    # Create output directory
    output_dir = Path(f"/home/devoop/Documents/Datasets/retention/{facility_name}")
    output_dir.mkdir(exist_ok=True, parents=True)
    
    # Define tables to export
    tables = [
        'tblvisits',
        'tblpatients',
        'tblpatientspriorexposure',
        'tblpregnancies',
        'tbltests',
        'tblstatus',
        'tblpatientsproblems',
        'tblappointments',
        'tblmedication',
        'tblexposedinfants',
        'tblexposedinfanttests',
        'tblexposedinfantvisits',
        'tblexposedinfantmedication'
    ]
    
    # Process each table
    for table_name in tables:
        print(f"Processing {table_name}...")
        
        try:
            # Read data
            df = pd.read_sql(f"SELECT * FROM {table_name}", engine)
            
            # Add facility information
            df = add_facility_info(df, facility_info)
            
            # Convert all columns to string for Stata compatibility
            df = df.astype(str)
            
            # Export to Stata format
            output_file = output_dir / f"{table_name}.dta"
            convert_strl = df.columns[(df.isnull().all()) & (df.dtypes == object)].tolist()
            df.to_stata(output_file, version=118, convert_strl=convert_strl)
            
            print(f"Exported {table_name} to {output_file}")
        except Exception as e:
            print(f"Error processing {table_name}: {e}")

def main():
    """Main function to orchestrate the ETL process."""
    conn = None
    try:
        # Connect to database
        conn = connect_to_db()
        print("Connected to database.")
        
        # Create SQLAlchemy engine for pandas
        engine = get_sqlalchemy_engine()
        print("SQLAlchemy engine created.")
        
        # Get facility information
        facility_info = get_facility_info(engine)
        if facility_info.empty:
            print("No facility information found.")
            return
        
        print(f"Found facility information: {facility_info.iloc[0].to_dict()}")
        
        # Process TB screening data
        facility_name = process_tb_screening(engine, facility_info)
        
        # Process retention data
        process_retention(engine, facility_info, facility_name)
        
        print("Processing completed successfully.")
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        
    finally:
        if conn and conn.is_connected():
            conn.close()
            print("Database connection closed.")

if __name__ == "__main__":
    main()