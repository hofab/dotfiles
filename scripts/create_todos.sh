#!/bin/bash

# Get the current month and year
current_month=$(date +%m)
current_year=$(date +%Y)

# Get the first day of the current month
first_day_of_month=$(date -d "$current_year-$current_month-01" +%Y-%m-%d)

# Iterate through the days of the month
current_day=$first_day_of_month

while [ $(date -d "$current_day" +%m) -eq $current_month ]; do
    # Check if the current day is Monday (1)
    if [ $(date -d "$current_day" +%u) -eq 1 ]; then
        # Format the date as YYYY-MM-DD
        formatted_date=$(date -d "$current_day" +%Y-%m-%d)
        FILENAME = "todo_$formatted_date.md"
        if [ ! -e $FILENAME ]; then
            # Create the file
            touch $FILENAME
            echo "# TODO for the week of $formatted_date" >> $FILENAME
            echo "" >> $FILENAME
            echo "## Project" >> $FILENAME
            echo "" >> $FILENAME
            echo "## Questions:" >> $FILENAME
            echo "Created file: $FILENAME"
        fi
    fi
    # Move to the next day
    current_day=$(date -d "$current_day + 1 day" +%Y-%m-%d)
done

