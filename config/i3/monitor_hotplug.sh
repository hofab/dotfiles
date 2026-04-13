#!/bin/bash

# Log file for debugging
LOGFILE="/tmp/monitor-hotplug.log"
I3_CONFIG="$HOME/.config/i3"

. ~/.config/i3/mon_config

# Log function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOGFILE"
}

log "=== Monitor hotplug triggered ==="

# Wait a bit for the system to settle
sleep 2

source get_edid.sh

# Get current output names
LEFT_MON=$(get_output_by_edid_pattern "$LEFT_EDID_PATTERN")
RIGHT_MON=$(get_output_by_edid_pattern "$RIGHT_EDID_PATTERN")
LAPTOP_MON="eDP-1"  # Adjust if your laptop screen has different name

log "Left monitor: $LEFT_MON"
log "Right monitor: $RIGHT_MON"
log "Laptop: $LAPTOP_MON"

# Determine setup and configure
if [ -n "$LEFT_MON" ] && [ -n "$RIGHT_MON" ]; then
    log "Triple monitor setup detected"

    # Configure xrandr
    # xrandr --output "$LAPTOP_MON" --off \
    #        --output "$LEFT_MON" "$LEFT_MON_ARGS" \
    #        --output "$RIGHT_MON" "$RIGHT_MON_ARGS"
    xrandr \
        --output ${LEFT_MON} ${LEFT_MON_ARGS} \
        --output ${RIGHT_MON} ${RIGHT_MON_ARGS} \
        --output ${LAPTOP_MON} --off

    # Restart i3 to apply changes
    i3-msg restart

    log "Applied triple monitor configuration"
else
    log "Laptop only setup"

    xrandr --output "$LAPTOP_MON" --auto --primary

    # Turn off disconnected outputs
    xrandr | grep " disconnected" | awk '{print $1}' | while read output; do
        xrandr --output "$output" --off
    done

    i3-msg restart

    log "Applied single monitor configuration"
fi

log "=== Monitor configuration complete ==="
