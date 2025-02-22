FROM python:3.12-slim

# Change the timezone to UTC+8 - best to do this consistently
RUN ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime

# Install necessary packages
RUN apt update && apt install cron supervisor -y

# Copy cron configuration
COPY crontab /mycron
RUN chmod 644 /mycron  # Correct permissions for cron files
RUN crontab /mycron

# Copy Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]