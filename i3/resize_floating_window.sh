#!/bin/bash
# This script should resize the last opened window
#
WINDOW_NAME="notetaker_window"

# Get primary monitor geometry: WIDTH HEIGHT X_OFFSET Y_OFFSET
# Get the line with the primary monitor
PRIMARY_LINE=$(xrandr | awk '/ connected primary/')

# Extract geometry from it: format is like "1920x1080+0+0"
GEOMETRY=$(echo "$PRIMARY_LINE" | grep -o '[0-9]\+x[0-9]\++[0-9]\++[0-9]\+')

# Parse width, height, x offset, y offset
IFS='x+' # changes the bash separator temporarily
read MON_W MON_H MON_X MON_Y <<< "$GEOMETRY"

# Set desired window size (e.g., 60% of monitor)
WIN_W=$((MON_W * 95 / 100))
WIN_H=$((MON_H * 95 / 100))

# Calculate top-left corner to center window
POS_X=$((MON_X + (MON_W - WIN_W) / 2))
POS_Y=$((MON_Y + (MON_H - WIN_H) / 2))

# Resize and move the focused window
# i3-msg "floating enable, resize set width ${WIN_W}px height ${WIN_H}px, move position ${POS_X}px ${POS_Y}px"

# Wait for the window to appear (max 50 * 0.1s = 5 seconds)
for i in {1..50}; do
    # Get the window ID of the most recent window with the title "notetaker_window"
    WIN_ID=$(i3-msg -t get_tree | jq '.. | select(.name? == "notetaker_window") | .id' | tail -n1)
    if [ -n "$WIN_ID" ]; then
        break
    fi
    sleep 0.1
done

# Apply resize and move if window was found
if [ -n "$WIN_ID" ]; then
    i3-msg "[con_id=$WIN_ID]" "floating enable, resize set ${WIN_W} ${WIN_H}, move position ${POS_X} ${POS_Y}"
fi

