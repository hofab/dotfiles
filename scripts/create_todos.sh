#!/bin/bash

# Get the current month and year
current_month=$(date +%m)
current_year=$(date +%Y)

# Format the filename as YYYY-MM
FILENAME="todo_${current_year}-${current_month}.md"

# Check if the file already exists
if [ ! -e "$FILENAME" ]; then
    # Create the file
    touch "$FILENAME"
    echo "# TODO for $current_year-$current_month" >> "$FILENAME"
    echo "" >> "$FILENAME"
    echo "## Project" >> "$FILENAME"
    echo "" >> "$FILENAME"
    echo "## Questions:" >> "$FILENAME"
    echo "Created file: $FILENAME"
fi

