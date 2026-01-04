# Use Python 3.6 as required by runtime.txt
FROM python:3.6-slim

# Set the working directory
WORKDIR /app

# Install system dependencies (needed for psycopg2/postgres)
RUN apt-get update && apt-get install -y libpq-dev gcc

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Command to start the bot
CMD ["python3", "-m", "tg_bot"]
