# Automated Data Processor

## Overview
This system automatically processes SQL database dumps (e.g., from EPMS), extracts relevant data (TB screening, retention data), and exports it to CSV and Stata (.dta) formats. It uses Docker to manage the database and processing environment, ensuring consistency and isolation.

## Prerequisites
- Docker
- Docker Compose

## Setup
1. Ensure Docker is running.
2. Run the setup script to create necessary directories and start the services:
   ```bash
   ./bash.sh
   ```

## Usage

### Automatic Processing
The system runs in the background and watches for new files.

1. **Input:** Copy or move your `.sql` database backup files into:
   `~/Documents/Datasets/data/databases`

2. **Processing:** The system will automatically:
   - Detect the new file.
   - Load it into a temporary MySQL database inside the Docker container.
   - Run the data extraction script (`data_extraction.py`).
   - Move the processed SQL file to `~/Documents/Datasets/data/processed_databases`.

3. **Output:**
   - **TB Screening Data (CSV):** `~/Documents/Datasets/data/tb screening/`
   - **Retention Data (Stata .dta):** `~/Documents/Datasets/data/retention/<Facility Name>/`

### Manual Control
- **Start Services:** `docker-compose up -d`
- **View Logs:** `docker-compose logs -f processor`
- **Stop Services:** `docker-compose down`

## Troubleshooting
- **Logs:** If a file isn't processing, check the logs: `docker-compose logs -f processor`
- **Connection Issues:** The extraction script uses environment variables to connect to the database. Ensure `DB_HOST`, `DB_USER`, `DB_PASSWORD`, and `DB_NAME` are correctly set in `docker-compose.yml`.
- **SSL Errors:** The system is configured to disable SSL for internal Docker connections (`ssl_disabled=True`).
- **File Types:** Only `.sql` files are processed. Other files (like CSV or Stata files) in the input directory are ignored.
