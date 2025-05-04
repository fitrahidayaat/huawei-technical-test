#!/bin/bash

# Create directory if it doesn't exist
mkdir -p /home/cron

# Get current date and time
DATE=$(date +"%m%d%Y")
HOUR=$(date +"%H.00")

# Output file name
OUTPUT_FILE="/home/cron/cron_${DATE}_${HOUR}.csv"

# Get data from internet (weather data from wttr.in)
echo "timestamp,location,temperature,condition,cloudcover,humidity,pressure,uvIndex,visibility" > "$OUTPUT_FILE"

# List of cities to collect data from
CITIES=("Jakarta" "Bandung" "Surabaya")

for CITY in "${CITIES[@]}"; do
    # Get weather data in JSON format
    WEATHER_DATA=$(curl -s "https://wttr.in/${CITY}?format=j1")
    
    # Extract required information
    TEMP=$(echo "$WEATHER_DATA" | grep -o '"temp_C": *"[^"]*"' | head -1 | cut -d'"' -f4)
    CONDITION=$(echo "$WEATHER_DATA" | grep -o '"value": *"[^"]*"' | head -1 | cut -d'"' -f4)
    CLOUDCOVER=$(echo "$WEATHER_DATA" | grep -o '"cloudcover": *"[^"]*"' | head -1 | cut -d'"' -f4)
    HUMIDITY=$(echo "$WEATHER_DATA" | grep -o '"humidity": *"[^"]*"' | head -1 | cut -d'"' -f4)
    PRESSURE=$(echo "$WEATHER_DATA" | grep -o '"pressure": *"[^"]*"' | head -1 | cut -d'"' -f4)
    UVINDEX=$(echo "$WEATHER_DATA" | grep -o '"uvIndex": *"[^"]*"' | head -1 | cut -d'"' -f4)
    VISIBILITY=$(echo "$WEATHER_DATA" | grep -o '"visibility": *"[^"]*"' | head -1 | cut -d'"' -f4)
    
    # Add to CSV file
    echo "$(date +"%Y-%m-%d %H:%M:%S"),$CITY,$TEMP,$CONDITION,$CLOUDCOVER,$HUMIDITY,$PRESSURE,$UVINDEX,$VISIBILITY" >> "$OUTPUT_FILE"
done
echo "Data successfully collected and saved to $OUTPUT_FILE"