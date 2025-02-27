#!/bin/bash

# Ensure the backups directory exists
BACKUP_DIR="backups"
mkdir -p "$BACKUP_DIR"

# Prompt the user to input a filename
echo "Enter the filename you want to back up:"
read -r FILENAME

# Check if the file exists
if [ ! -f "$FILENAME" ]; then
    echo "Error: File '$FILENAME' does not exist."
    exit 1
fi

# Determine the backup file path
BACKUP_FILE="$BACKUP_DIR/$(basename "$FILENAME")"

# Check if a backup already exists
if [ -f "$BACKUP_FILE" ]; then
    echo "Backup already exists."
else
    # Copy the file to the backup directory
    cp "$FILENAME" "$BACKUP_DIR"
    echo "Backup completed."
fi
