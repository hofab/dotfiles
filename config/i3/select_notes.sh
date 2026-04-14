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
    LAST_MONTH=$(date -d "-1 month" +%Y-%m)
    NEXT_MONTH=$(date -d "+1 month" +%Y-%m)

    # Calculate this week's Monday
    DAY_OF_WEEK=$(date +%u)  # Monday = 1, Sunday = 7
    if [ "$DAY_OF_WEEK" -gt 1 ]; then
        # If today is after Monday, calculate the previous Monday
        THIS_MONDAY=$(date -d "this monday - 7 days" +%Y-%m-%d)
    else
        # If today is Monday or earlier, use this Monday
        THIS_MONDAY=$(date -d "this monday" +%Y-%m-%d)
    fi

    # Calculate last week's Monday
    LAST_MONDAY=$(date -d "${THIS_MONDAY} - 7 days" +%Y-%m-%d)

    # Calculate next week's Monday
    NEXT_MONDAY=$(date -d "${THIS_MONDAY} + 7 days" +%Y-%m-%d)
}

create_note() {
    local FILENAME=$1

    # extract date from filename
    DATE=$(echo "$FILENAME" | sed -n 's/.*\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\).*/\1/p')

    if [ ! -f $FILENAME ]; then
      echo "# Notes for ${DATE}" >> $FILENAME
      echo "## Tasks" >> $FILENAME
      echo "- " >> $FILENAME
    fi
}

# Function to open the note file
open_note() {
    local file=$1
    echo "${file}"

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

create_dir() {
    local dir=$1
    # Source - https://stackoverflow.com/a/59839
    # Posted by Grundlefleck, modified by community. See post 'Timeline' for change history
    # Retrieved 2026-04-14, License - CC BY-SA 4.0

    if [ ! -d "${dir}" ]; then
        mkdir -p ${dir}
    fi
}

# Get the dates
get_dates

#create base directory for todo
create_dir "${TODO_LOCATION}"

# Check the input argument
case $1 in
    -y)
        create_dir "${NOTES_LOCATION}/${YESTERDAYS_MONTH}"
        open_note "${NOTES_LOCATION}/${YESTERDAYS_MONTH}/${YESTERDAY}.md"
        ;;
    -t)
        create_dir "${NOTES_LOCATION}/${TOMORROWS_MONTH}"
        open_note "${NOTES_LOCATION}/${TOMORROWS_MONTH}/${TOMORROW}.md"
        ;;
    -l)
        open_note "${TODO_LOCATION}/${LAST_MONTH}.md"
        ;;
    -n)
        open_note "${TODO_LOCATION}/${NEXT_MONTH}.md"
        ;;
    -c)
        open_note "${TODO_LOCATION}/${TODAYS_MONTH}.md"
        ;;
    "")
        create_dir "${NOTES_LOCATION}/${TODAYS_MONTH}"
        open_note "${NOTES_LOCATION}/${TODAYS_MONTH}/${TODAY}.md"
        ;;
    *)
        echo "Usage: $0 {-y | -t | -l | -n | -c}"
        echo "  -y    Open yesterday's notes"
        echo "  -t    Open tomorrow's notes"
        echo "  -l    Open last month's notes"
        echo "  -n    Open next month's notes"
        echo "  -c    Open this month's notes"
        ;;
esac

