#!/bin/bash

. ~/.config/i3/mon_config

# Function to get output by EDID pattern
get_output_by_edid_pattern() {
    local pattern="$1"
    xrandr --prop | awk -v pat="$pattern" '
        /^[A-Za-z0-9._-]+ (connected|disconnected)/ { output = $1 }
        tolower($0) ~ tolower(pat) { print output; exit }
    '
}
# Get current output names
LEFT_MON=$(get_output_by_edid_pattern "$LEFT_EDID_PATTERN")
RIGHT_MON=$(get_output_by_edid_pattern "$RIGHT_EDID_PATTERN")
LAPTOP=$(get_output_by_edid_pattern "$RIGHT_EDID_PATTERN")

# Fallback to defaults if not found
LEFT_MON="${LEFT_MON:-DP-1-7}"
RIGHT_MON="${RIGHT_MON:-DP-1-8}"
LAPTOP="${LAPTOP:-eDP-1}"

# Generate i3 config fragment
cat > ~/.config/i3/monitors.conf <<EOF
set \$laptop "$LAPTOP"
set \$rightmon "$RIGHT_MON"
set \$leftmon "$LEFT_MON"
EOF

echo "Detected monitors: LEFT=$LEFT_MON, RIGHT=$RIGHT_MON LAPTOP=$LAPTOP"
