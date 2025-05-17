#!/bin/zsh
# Script to restart the Flask backend and clear cache

echo "====================================="
echo "Restarting Flask server and clearing cache"
echo "====================================="

# Kill any running Python processes
if pgrep -f "python.*run.py" > /dev/null; then
    echo "Stopping existing Flask server..."
    pkill -f "python.*run.py"
    sleep 1
fi

# Clear Flask cache by removing pycache directories
echo "Clearing Python cache..."
find . -type d -name "__pycache__" -exec rm -rf {} +

# Make sure utils directory exists
mkdir -p app/utils

# Start the server in debug mode
export FLASK_ENV=development
export FLASK_DEBUG=1
export FLASK_APP=run.py

echo "Starting Flask server..."
python run.py &

echo "====================================="
echo "Server is running at http://localhost:5001"
echo "Press Ctrl+C to stop"
echo "====================================="

wait
