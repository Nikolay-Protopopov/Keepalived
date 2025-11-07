#!/bin/sh
# Web server health check script for Keepalived

# Check if port 80 is accessible
if ! nc -z -w 3 localhost 80; then
    exit 1
fi

# Check if index.html exists and is not empty
if [ ! -f /var/www/html/index.html ] || [ ! -s /var/www/html/index.html ]; then
    exit 1
fi

exit 0