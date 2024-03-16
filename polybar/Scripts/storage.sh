#!/bin/bash

# Set default values
DIR="${DIR:-$BLOCK_INSTANCE}"
DIR="${DIR:-$HOME}"
ALERT_LOW="${ALERT_LOW:-$1}"
ALERT_LOW="${ALERT_LOW:-10}" # color will turn red under this value (default: 10%)

LOCAL_FLAG="-l"
if [ "$1" = "-n" ] || [ "$2" = "-n" ]; then
    LOCAL_FLAG=""
fi

# Execute the df command to get disk usage information
df_output=$(df -h -P $LOCAL_FLAG "$DIR")

# Extract relevant information
disk_space=$(echo "$df_output" | awk 'NR==2{print $4}')
use_percentage=$(echo "$df_output" | awk 'NR==2{print $5}')

# Remove '%' from use_percentage
use_percentage=${use_percentage%\%}

# Output the disk space
echo "$disk_space"

# Check if usage is below the alert low threshold
if ((100 - use_percentage < ALERT_LOW)); then
    # Output color code for Polybar to indicate low disk space
    echo "#FF0000"
fi
