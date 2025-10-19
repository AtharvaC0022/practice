# Use lightweight Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy dependency file first (if available)
COPY requirements.txt .

# Install dependencies (safe even if no requirements.txt exists)
RUN pip install --no-cache-dir --upgrade pip && \
    if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Copy all app files
COPY . .

# Expose Flask port
EXPOSE 5001

# Environment variables
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

# Command to run Flask app
CMD ["flask", "run"]

#added to github
