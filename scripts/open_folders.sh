#!/usr/bin/env bash

# Fixed set of folders
local_folders=("$HOME/Downloads" \
         "$HOME/Documents")

# Function: get folders from fstab
get_fstab_folders() {
    local fstab_file="/etc/fstab"
    local folders=()

    # Only lines that are not commented and have type cifs (network share)
    while read -r device mountpoint fstype _; do
        # Skip comments and empty lines
        [[ "$device" =~ ^#.* ]] && continue
        [[ -z "$device" ]] && continue

        # Only include CIFS mounts (or any type you like)
        if [[ "$fstype" == "cifs" ]]; then
            # Check if mountpoint exists
            if [[ -d "$mountpoint" ]]; then
                folders+=("$mountpoint")
            fi
        fi
    done < "$fstab_file"

    echo "${folders[@]}"
}

# Folders from fstab
fstab_folders=($(get_fstab_folders))

# Combine them
all_folders=("${local_folders[@]}" "${fstab_folders[@]}")



# Function to open folder in terminal
open_folder() {
    local dir="$1"
    [ -d "$dir" ] || { echo "Folder does not exist: $dir"; exit 1; }
    setsid -f "$TERMINAL" -e bash -c "cd '$dir' && exec \$SHELL" >/dev/null 2>&1
}

# Select folder via rofi
selected=$(printf "%s\n" "${all_folders[@]}" \
    | rofi -i \
     -matching fuzzy \
     -dmenu \
     -window-class RofiFloat \
     -p "Choose folder:")


[ -z "$selected" ] && exit 0

open_folder "$selected"

