#!/bin/bash

# Create a crontab file with the cron job
echo "58 23 * * * /app/daily.sh >> /app/src/workspace/cron.log 2>&1" > /etc/cron.d/daily

# Set correct permissions for the crontab file
chmod 0644 /etc/cron.d/daily

# Apply the crontab file
crontab /etc/cron.d/daily