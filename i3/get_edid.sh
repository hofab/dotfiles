#!/bin/bash

. ~/.config/i3/mon_config

# Function to get output by EDID pattern
get_output_by_edid_pattern() {
    local pattern="$1"
    xrandr --prop | awk -v pattern="$pattern" '
        /^[^ ]+ connected/ { output=$1 }
        /EDID:/ {
            edid=""
            while (getline && /^[[:space:]]+[0-9a-f]/) {
                edid = edid $0
            }
            if (edid ~ pattern) {
                print output
                exit
            }
        }
    '
}

# Get current output names
LEFT_MON=$(get_output_by_edid_pattern "$LEFT_EDID_PATTERN")
RIGHT_MON=$(get_output_by_edid_pattern "$RIGHT_EDID_PATTERN")

# Fallback to defaults if not found
LEFT_MON="${LEFT_MON:-DVI-I-3-2}"
RIGHT_MON="${RIGHT_MON:-DVI-I-2-1}"

# Generate i3 config fragment
cat > ~/.config/i3/monitors.conf <<EOF
set \$rightmon "$RIGHT_MON"
set \$leftmon "$LEFT_MON"
EOF

echo "Detected monitors: LEFT=$LEFT_MON, RIGHT=$RIGHT_MON"
