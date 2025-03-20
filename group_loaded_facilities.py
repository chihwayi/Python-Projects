import pandas as pd
import os

# Read the CSV file
df = pd.read_csv('/home/devoop/Downloads/Documents/unique_facilities.csv')

# Select the required columns
selected_columns = df[['Art Province Name', 'Art District Name', 
                      'Art Facility ID', 'Art Facility Name']]

# Create hierarchical grouping
district_summary = selected_columns.groupby(
    ['Art Province Name', 'Art District Name']
).agg({
    'Art Facility ID': 'count',
    'Art Facility Name': lambda x: list(x)
}).reset_index()

# Rename columns for clarity
district_summary.columns = ['Province', 'District', 'Facility Count', 'Facilities']

# Sort by Province and District
district_summary = district_summary.sort_values(['Province', 'District'])

# Get the directory path of the input file
input_dir = os.path.dirname(os.path.abspath('your_file.csv'))

# Create output filenames
csv_filename = os.path.join(input_dir, 'facility_hierarchy.csv')
excel_filename = os.path.join(input_dir, 'facility_hierarchy.xlsx')

# Save to CSV file
district_summary.to_csv(csv_filename, index=False)
print(f"\nCSV file saved to: {csv_filename}")

# Save to Excel file with proper formatting
with pd.ExcelWriter(excel_filename, engine='openpyxl') as writer:
    # Write the main data
    district_summary.to_excel(writer, sheet_name='Facility Hierarchy', index=False)
    
    # Create a summary sheet
    province_summary = district_summary.groupby('Province').agg({
        'District': 'count',
        'Facility Count': 'sum'
    }).reset_index()
    province_summary.columns = ['Province', 'Number of Districts', 'Total Facilities']
    province_summary.to_excel(writer, sheet_name='Province Summary', index=False)

print(f"Excel file saved to: {excel_filename}")

# Display the data as before
print("\nDetailed breakdown of facilities by province and district:")
print("=" * 80)
for province in district_summary['Province'].unique():
    province_data = district_summary[district_summary['Province'] == province]
    print(f"\n{province}")
    print("-" * len(province))
    
    # Print district details
    for _, row in province_data.iterrows():
        print(f"  {row['District']}: {row['Facility Count']} facilities")
    
    # Print province total
    total_facilities = province_data['Facility Count'].sum()
    print(f"  Total Facilities in {province}: {total_facilities}")
    print("=" * 80)

# Display summary
print("\nSummary by province:")
print(province_summary.to_string(index=False))