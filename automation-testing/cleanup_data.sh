#!/bin/bash

# Directory containing files to be cleaned up
TARGET_DIR="/home/cron"

# Delete files older than 30 days
find "$TARGET_DIR" -name "cron_*.csv" -type f -mtime +30 -exec rm {} \;

echo "Cleanup completed. Files older than 30 days have been deleted."
