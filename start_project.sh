#!/bin/bash
# Script to start both frontend and backend for production environment

echo "===================================="
echo "   Starting project in production environment"
echo "===================================="

# Project root directory
PROJECT_DIR="/Users/nhatpm/Desktop/project"
BACKEND_DIR="$PROJECT_DIR/backend"
FRONTEND_DIR="$PROJECT_DIR/frontend"

# Check and stop running processes
echo "Checking and stopping running processes..."
pkill -f "node.*react-scripts" 2>/dev/null
pkill -f "python.*run.py" 2>/dev/null
pkill -f "gunicorn" 2>/dev/null

# 1. Start backend
echo "Starting backend..."
cd "$BACKEND_DIR" || { echo "Backend directory not found!"; exit 1; }

# Check Python virtual environment
if [ -d "venv" ] || [ -d ".venv" ]; then
    # Activate virtual environment if it exists
    if [ -d "venv" ]; then
        source venv/bin/activate
    else
        source .venv/bin/activate
    fi
    echo "Python virtual environment activated"
else
    echo "Warning: Python virtual environment not found. Using system Python."
fi

# Start backend with Gunicorn in production
echo "Starting backend with Gunicorn..."
gunicorn -c gunicorn_config.py run:app &
BACKEND_PID=$!
echo "Backend started with PID: $BACKEND_PID"

# 2. Start Frontend 
echo "Starting frontend..."
cd "$FRONTEND_DIR" || { echo "Frontend directory not found!"; exit 1; }

# Check if frontend is already built
if [ ! -d "build" ] || [ -z "$(ls -A build 2>/dev/null)" ]; then
    echo "Build directory doesn't exist or is empty. Building frontend..."
    npm run build
    if [ $? -ne 0 ]; then
        echo "Error building frontend!"
        exit 1
    fi
fi

# Start frontend with serve
echo "Starting frontend with serve..."
npx serve -s build &
FRONTEND_PID=$!
echo "Frontend started with PID: $FRONTEND_PID"

echo ""
echo "===================================="
echo "   Project started successfully!"
echo "   Backend: http://localhost:5000"
echo "   Frontend: http://localhost:3000"
echo "===================================="
echo ""
echo "Press Ctrl+C to stop all servers"

# Handle script cancellation
trap 'echo "Stopping servers..."; kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit 0' INT TERM

# Keep script running
wait