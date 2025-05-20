#!/bin/bash

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install -r requirements.txt

# Install frontend dependencies and serve
cd frontend
npm install
npm install -g serve
npm run build
cd ..

# Create necessary directories
mkdir -p backend/static
mkdir -p backend/templates

# Copy frontend build to backend static directory
cp -r frontend/build/* backend/static/ 