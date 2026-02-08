FROM python:3.9-slim

# Install system dependencies (mysql-client for the mysql command)
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set environment variables (can be overridden by docker-compose)
ENV PYTHONUNBUFFERED=1

CMD ["python", "automated_data_processor.py"]
