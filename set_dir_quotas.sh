#!/bin/bash

# Prompt the user for the base directory
read -p "Enter the base directory: " BASE_DIR

if [ ! -d "$BASE_DIR" ]; then
    echo "The specified directory does not exist. Exiting."
    exit 1
fi

# Prompt the user for the quota size
read -p "Enter the quota size (e.g., 10GB, 500MB): " QUOTA_SIZE

for subdir in "$BASE_DIR"/*; do
    if [ -d "$subdir" ]; then
        nssquota -D -d "$subdir" -s "$QUOTA_SIZE"
        echo "Quota of $QUOTA_SIZE set for $subdir"
    fi
done
