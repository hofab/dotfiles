#!/bin/bash

# we should first check that we can ping the ip/host
$HOME/.config/i3/vpn_status.sh

if [ ! $? -eq 0 ]; then
    dunstify "Network Mount" "VPN not connected" -u critical
    exit 1
fi

CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/dotfiles/private-work-files/network_drives}/drives.conf"

# Check if config exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    dunstify "Network Mount" "Config file not found: $CONFIG_FILE" -u critical
    exit 1
fi

# Extract CIFS mounts from config with labels
declare -a LABELS
declare -a MOUNT_POINTS

while read -r line; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    # Extract mount point (2nd field) and label (after # in comment)
    mount_point=$(echo "$line" | awk '{print $2}')
    label=$(echo "$line" | grep -oP '# \K.*' | head -1)

    # Use mount point as label if no comment
    [[ -z "$label" ]] && label="$mount_point"

    LABELS+=("$label")
    MOUNT_POINTS+=("$mount_point")
done < "$CONFIG_FILE"

# Build rofi menu with mount status
MENU_ITEMS=()
for i in "${!LABELS[@]}"; do
    if timeout 1 mountpoint -q "${MOUNT_POINTS[$i]}" 2>/dev/null; then
        MENU_ITEMS+=("${LABELS[$i]} (mounted)")
    else
        MENU_ITEMS+=("${LABELS[$i]}")
    fi
done

# Show rofi selection
SELECTION=$(printf '%s\n' "${MENU_ITEMS[@]}" | rofi -dmenu -p "Mount Network Drive" -theme-str 'window {width: 400px;}')

# Find selected index
SELECTED_INDEX=-1
for i in "${!MENU_ITEMS[@]}"; do
    if [[ "${MENU_ITEMS[$i]}" == "$SELECTION" ]]; then
        SELECTED_INDEX=$i
        break
    fi
done

# Exit if no selection
[[ $SELECTED_INDEX -eq -1 ]] && exit 0

MOUNT_POINT="${MOUNT_POINTS[$SELECTED_INDEX]}"

# construct mount command
line=$(grep -m 1 ${MOUNT_POINT} ${CONFIG_FILE})

# Extract fields
src=$(echo "$line" | awk '{print $1}')
dst=$(echo "$line" | awk '{print $2}')
type=$(echo "$line" | awk '{print $3}')
opts=$(echo "$line" | awk '{print $4}')

MOUNT_CMD="sudo mount -t $type $src $dst -o $opts"

# Check if already mounted and toggle
if timeout 1 mountpoint -q "$MOUNT_POINT" 2>/dev/null; then
    if sudo umount "$MOUNT_POINT" 2>/dev/null; then
        dunstify "Network Mount" "Unmounted: $MOUNT_POINT"
    else
        dunstify "Network Mount" "Failed to unmount: $MOUNT_POINT" -u critical
    fi
else
    if ${MOUNT_CMD} 2>/dev/null; then
        dunstify "Network Mount" "Mounted: $MOUNT_POINT"
    else
        dunstify "Network Mount" "Failed to mount: $MOUNT_POINT" -u critical
    fi
fi

