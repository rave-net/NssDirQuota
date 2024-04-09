#!/bin/bash

# Use environment variables if set, otherwise prompt the user
BASE_DIR=${BASE_DIR:-$(read -p "Enter the base directory: " BASE_DIR; echo $BASE_DIR)}
QUOTA_SIZE=${QUOTA_SIZE:-$(read -p "Enter the quota size (e.g., 10GB, 500MB): " QUOTA_SIZE; echo $QUOTA_SIZE)}

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
