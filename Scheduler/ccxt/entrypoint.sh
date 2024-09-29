#!/bin/bash

# read from setting
chmod +x /app/setting.sh
/app/setting.sh

# Create the log file if it doesn't exist
touch /app/src/workspace/cron.log

# Start cron in the background
service cron start

chmod +x /app/daily.sh

# Start the Uvicorn server
tail -f /dev/null



