#!/bin/bash

# Create required directories locally (mapped to container)
mkdir -p ~/Documents/Datasets/data/databases
mkdir -p ~/Documents/Datasets/data/processed_databases
mkdir -p ~/Documents/Datasets/data/backup_databases
mkdir -p ~/Documents/Datasets/data/template_database
mkdir -p ~/Documents/Datasets/data/tb\ screening
mkdir -p ~/Documents/Datasets/data/retention

echo "Directories created at ~/Documents/Datasets/data/"

echo "Starting Docker services..."
docker-compose up -d --build

echo "Waiting for services to initialize..."
sleep 10

# Prompt for template creation
echo
echo "Do you want to create a template database now? (y/n)"
read create_template

if [ "$create_template" = "y" ]; then
    echo "You'll need to provide a source database SQL file that contains the reference tables."
    echo "The file path you provide should be mapped inside the container."
    echo "For example, if you put the file in ~/Documents/Datasets/data/databases/myfile.sql,"
    echo "the path inside the container is /data/databases/myfile.sql"
    echo
    echo "Running template creation tool inside Docker..."
    docker-compose run --rm processor python automated_data_processor.py --create-template
else
    echo "You can create a template database later by running:"
    echo "docker-compose run --rm processor python automated_data_processor.py --create-template"
fi

echo
echo "Setup completed!"
echo "The processor is running in the background."
echo "To view logs: docker-compose logs -f processor"
echo "To stop: docker-compose down"
