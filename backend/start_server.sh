#!/bin/bash

# Activate virtual environment
source venv/bin/activate

# Create root user if it doesn't exist (first deployment)
echo "Checking and creating root user if needed..."
python create_root_user.py

# Run migrations to ensure tables exist
echo "Running migrations..."
python -m flask db upgrade

# Log startup
echo "Starting server at $(date)"

# Set environment variable to enable CORS debug logs
export FLASK_DEBUG=1
export FLASK_ENV=development

# Run Gunicorn with the configuration file
gunicorn -c gunicorn_config.py "app:create_app()" --log-level debug
