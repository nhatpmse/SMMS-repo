# Gunicorn configuration for production
import multiprocessing

# Bind to 0.0.0.0:8000
bind = "0.0.0.0:8000"

# Number of worker processes
workers = multiprocessing.cpu_count() * 2 + 1

# Worker class to use
worker_class = "gthread"

# Number of threads per worker
threads = 2

# Timeout in seconds
timeout = 30

# Reload the application if any file changes
reload = False

# Log level
loglevel = "info"

