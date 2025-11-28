#!/usr/bin/env bash

echo "TRI-SCRIPT"

. ~/.config/i3/mon_config
source ~/.config/i3/get_edid.sh

if [[ ! -z ${RIGHT_MON} ]]; then
    if [[ ! -z ${LEFT_MON} ]]; then
        xrandr \
            --output $RIGHT_MON $RIGHT_MON_ARGS \
            --output $LEFT_MON $LEFT_MON_ARGS \
            --output eDP-1 --off
    fi
fi




