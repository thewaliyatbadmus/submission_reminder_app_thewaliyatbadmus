#!/bin/bash

# Prompt user for the new assignment name
read -p "Enter the new assignment name: " assignment

# Path to config file
CONFIG_FILE="config/config.env"

# Check if config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: $CONFIG_FILE not found!"
  exit 1
fi

# Replace line 2 with new ASSIGNMENT value using sed
sed -i.bak "2s|.*|ASSIGNMENT=${assignment}|" "$CONFIG_FILE"

# Confirm success
echo "✅ Updated ASSIGNMENT to '$assignment' in $CONFIG_FILE"

# Optional: Delete the backup
rm -f "${CONFIG_FILE}.bak"

# Prompt user to run startup script
echo "➡️  Now you can run ./startup.sh to continue."
