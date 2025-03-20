import pandas as pd

# Read the CSV file
df = pd.read_csv('/home/devoop/Downloads/Documents/CBS_11032025_1.csv')

# Select the required columns
selected_columns = df[['Art Province Name', 'Art District Name', 
                      'Art Facility ID', 'Art Facility Name']]

# Get unique rows based on Art Facility ID
unique_facilities = selected_columns.drop_duplicates(subset='Art Facility ID')

# Print the unique rows
print("\nUnique Facilities:")
print(unique_facilities)

# Save to a new CSV file
output_filename = '/home/devoop/Downloads/Documents/unique_facilities.csv'
unique_facilities.to_csv(output_filename, index=False)
print(f"\nSaved unique facilities to: {output_filename}")