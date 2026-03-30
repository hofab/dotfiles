#!/usr/bin/env bash

NOTES_DIR="$HOME/Notes"
TERMINAL="${TERMINAL:-alacritty}"   # change if needed
EDITOR="nvim"

[ -d "$NOTES_DIR" ] || exit 1

### MODE SELECTION ##########################################################

mode=$(printf "Files\nSearch text (rg)\n" | rofi -dmenu -p "Notes:")

[ -z "$mode" ] && exit 0

### FILE LIST MODE ##########################################################

if [[ "$mode" == "Files" ]]; then
    cd "$NOTES_DIR" || exit 1

    selected=$(find . -type f -printf '%P\n' | sort \
      | rofi -i \
          -matching fuzzy \
          -dmenu \
          -p "Open note:" \
          -preview 'sh -c '"'"'bat --style=plain --color=always --line-range :300 "$0"'"'"' "$NOTES_DIR/{}"'
    )

    [ -z "$selected" ] && exit 0

    exec "$TERMINAL" -e "$EDITOR" "$NOTES_DIR/$selected"
fi

### RIPGREP SEARCH MODE #####################################################

if [[ "$mode" == "Search text (rg)" ]]; then
    query=$(rofi -dmenu -p "Search Notes (rg):")
    [ -z "$query" ] && exit 0

    cd "$NOTES_DIR" || exit 1

    selected=$(rg --line-number --no-heading "$query" \
        | rofi -i \
            -dmenu \
            -p "Matches:" \
            -preview 'bat --style=plain --color=always --highlight-line {2} "$(cut -d: -f1 <<< {})"')

    [ -z "$selected" ] && exit 0

    file=$(cut -d: -f1 <<< "$selected")
    line=$(cut -d: -f2 <<< "$selected")

    exec "$TERMINAL" -e "$EDITOR" "+$line" "$file"
fi

