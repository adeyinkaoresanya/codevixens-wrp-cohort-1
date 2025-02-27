#!/bin/bash


#!/bin/bash

# Check if a directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

dir="$1"

# Verify the directory exists
if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' does not exist."
    exit 1
fi

declare -A extensions
extensions=(
    [txt]="TextFiles"
    [jpg]="Images"
    [jpeg]="Images"
    [png]="Images"
    [gif]="Images"
    [pdf]="PDFs"
    [doc]="Documents"
    [docx]="Documents"
    [xls]="Spreadsheets"
    [xlsx]="Spreadsheets"
    [csv]="DataFiles"
    [mp3]="Audio"
    [mp4]="Videos"
    [mov]="Videos"
    [zip]="Archives"
    [tar]="Archives"
    [gz]="Archives"
    [epub]="Books"
)

# Track moved files
moved_count=0

# Process files
for file in "$dir"/*; do
    if [ -f "$file" ]; then
        ext="${file##*.}"
        ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
        
        if [[ -n "${extensions[$ext_lower]}" ]]; then
            target_dir="$dir/${extensions[$ext_lower]}"
            
            # Create directory if it doesn't exist
            if [ ! -d "$target_dir" ]; then
                mkdir -p "$target_dir"
            fi
            
            # Move file
            mv "$file" "$target_dir/"
            ((moved_count++))
        fi
    fi
done

echo "Organization complete: $moved_count files moved."
