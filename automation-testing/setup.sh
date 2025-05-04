#!/bin/bash

# Script locations
COLLECT_SCRIPT="./collect_data.sh"
CLEANUP_SCRIPT="./cleanup_data.sh"

echo "Making scripts executable..."
chmod +x "$COLLECT_SCRIPT"
chmod +x "$CLEANUP_SCRIPT"

echo "Adding cron jobs to crontab..."
(crontab -l 2>/dev/null; \
echo "0 8 * * * $COLLECT_SCRIPT"; \
echo "0 12 * * * $COLLECT_SCRIPT"; \
echo "0 15 * * * $COLLECT_SCRIPT"; \
echo "0 0 * * * $CLEANUP_SCRIPT") | crontab -

echo "Done! Cron jobs have been set to run scripts at specified times."
echo "Data collection script will run at 08:00, 12:00, and 15:00 WIB every day."
echo "Data cleanup script will run at midnight every day."

# Display configured cron jobs
echo ""
echo "List of configured cron jobs:"
crontab -l
