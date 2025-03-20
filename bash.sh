#!/bin/bash

# Install required dependencies
pip install watchdog mysql-connector-python

# Create required directories
mkdir -p /home/devoop/Documents/Datasets/data/databases
mkdir -p /home/devoop/Documents/Datasets/data/processed_databases
mkdir -p /home/devoop/Documents/Datasets/data/backup_databases
mkdir -p /home/devoop/Documents/Datasets/data/template_database

# Set up MySQL permissions (you may need to adjust this)
echo "Checking MySQL permissions..."
mysql -u root -proot -e "SELECT 1;" > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "MySQL connection successful!"
else
    echo "Please check your MySQL credentials in the script."
fi

# Prompt for existing database to use as template source
echo
echo "Do you want to create a template database now? (y/n)"
read create_template

if [ "$create_template" = "y" ]; then
    echo "You'll need to provide a source database SQL file that contains the reference tables."
    echo "The script will extract the structure and reference data from this file."
    echo
    echo "Please run: python3 data_extraction.py --create-template"
    echo "and follow the prompts."
else
    echo "You can create a template database later by running:"
    echo "python python3 data_extraction.py --create-template"
fi

echo
echo "Setup completed! Now edit the database_processor.py file to set your paths correctly."
echo "Run in processing mode: python database_processor.py"
echo "Run in watch mode: python database_processor.py --watch"
echo "Create template database: python database_processor.py --create-template"