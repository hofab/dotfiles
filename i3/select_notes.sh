#!/bin/bash

EDITOR_="nvim"
NOTES_LOCATION="${HOME}/Notes/work"
TODO_LOCATION="${HOME}/Notes/todo"

# Function to get relevant dates in the format YYYY-MM-DD
get_dates() {
    TODAY=$(date +%Y-%m-%d)
    TODAYS_MONTH=$(date +%y_%m)
    YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)
    YESTERDAYS_MONTH=$(date -d "yesterday" +%y_%m)
    TOMORROW=$(date -d "tomorrow" +%Y-%m-%d)
    TOMORROWS_MONTH=$(date -d "tomorrow" +%y_%m)

    # Calculate this week's Monday
    THIS_MONDAY=$(date -d "last monday" +%Y-%m-%d)
    # Calculate last week's Monday
    LAST_MONDAY=$(date -d "last monday - 7 days" +%Y-%m-%d)
    # Calculate next week's Monday
    NEXT_MONDAY=$(date -d "next monday" +%Y-%m-%d)

    FORMATTED_MONTH=$(date +%y_%m)
}

create_note() {
    local FILENAME=$1

    # extract date from filename
    DATE=$(echo "$FILENAME" | sed -n 's/.*\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/p')

    if [ ! -f $FILENAME ]; then
      echo "# Notes for ${DATE}" >> $FILENAME
      echo "## Pomodoro" >> $FILENAME
      echo "\`\`\`" >> $FILENAME
      echo "     1h2h3h4h5h6h7h8h" >> $FILENAME
      echo "    [                ]" >> $FILENAME
      echo "\`\`\`" >> $FILENAME
      echo "" >> $FILENAME
      echo "## Tasks" >> $FILENAME
      echo "- " >> $FILENAME
    fi
}

# Function to open the note file
open_note() {
    local file=$1

    if [ -f "${file}" ]; then
        # Replace 'nano' with your preferred text editor
        ${EDITOR_} "${file}"
    else
        # add input variable to create files as needed otherwise notetaker
        # just creates the current days notes but we are opening an
        # empty file
        create_note "${file}"
        if [ -f $file ]; then
            ${EDITOR_} "${file}"
        else
            echo "File does not exist"
        fi
    fi
}

# Get the dates
get_dates

# Check the input argument
case $1 in
    -y)
        open_note "${NOTES_LOCATION}/${YESTERDAYS_MONTH}/${YESTERDAY}.md"
        ;;
    -t)
        open_note "${NOTES_LOCATION}/${TOMORROWS_MONTH}/${TOMORROW}.md"
        ;;
    -l)
        open_note "${TODO_LOCATION}/todo_${LAST_MONDAY}.md"
        ;;
    -n)
        open_note "${TODO_LOCATION}/todo_${NEXT_MONDAY}.md"
        ;;
    -c)
        open_note "${TODO_LOCATION}/todo_${THIS_MONDAY}.md"
        ;;
    "")
        open_note "${NOTES_LOCATION}/${TODAYS_MONTH}/${TODAY}.md"
        ;;
    *)
        echo "Usage: $0 {-y | -t | -l | -n | -c}"
        echo "  -y    Open yesterday's notes"
        echo "  -t    Open tomorrow's notes"
        echo "  -l    Open last week's notes (Monday)"
        echo "  -n    Open next week's notes (Monday)"
        echo "  -c    Open this week's notes (Monday)"
        ;;
esac

