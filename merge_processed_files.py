import pandas as pd
import glob

# Define the headers
headers = [
    "PatientID", "DateOfBirth", "Sex", "VisitDate", "VisitTypeCode", 
    "TBStatusDescription", "ARVStatusDescription", "DrugTypeID", 
    "Period", "Age", "Facilitycode", "Districtcode", "Provincecode", 
    "FacilityName", "District", "Province"
]

# Get all CSV files in the directory (adjust the path as needed)
file_list = glob.glob("/home/devoop/Documents/Datasets/tb screening/*.csv")

merged_data = pd.DataFrame(columns=headers)

for file in file_list:
    # Read the file
    data = pd.read_csv(file)
    
    # Add missing columns with empty data if necessary
    for column in headers:
        if column not in data.columns:
            data[column] = ""
    
    # Reorder columns to match the headers
    data = data[headers]
    
    # Append to the merged data
    merged_data = pd.concat([merged_data, data], ignore_index=True)

# Save the merged file
merged_data.to_csv("/home/devoop/Documents/Datasets/tb_screening_2024.csv", index=False)
print("Files successfully merged!")
