#!/bin/bash

# Function to prompt for input if necessary
prompt_for_input() {
    # Prompt for the base directory if not provided
    if [ -z "$BASE_DIR" ]; then
        read -p "Enter the base directory: " BASE_DIR
    fi

    # Check if the base directory exists
    if [ ! -d "$BASE_DIR" ]; then
        echo "The specified directory does not exist. Exiting."
        exit 1
    fi

    # Prompt for the quota size if not provided
    if [ -z "$QUOTA_SIZE" ]; then
        read -p "Enter the quota size (e.g., 10GB, 500MB): " QUOTA_SIZE
    fi
}

# Main script starts here

# Check if command-line arguments are provided
if [ $# -eq 2 ]; then
    BASE_DIR=$1
    QUOTA_SIZE=$2
else
    prompt_for_input
fi

# Apply quota to each subdirectory
for subdir in "$BASE_DIR"/*; do
    if [ -d "$subdir" ]; then
        nssquota -D -d "$subdir" -s "$QUOTA_SIZE"
        echo "Quota of $QUOTA_SIZE set for $subdir"
    fi
done
