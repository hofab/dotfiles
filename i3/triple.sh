#!/usr/bin/env bash

echo "TRI-SCRIPT"

source mon_config

if $(xrandr -q | grep -q DVI); then
    if $(xrandr -q | grep -q $LEFT_MON | grep -q "3840+0"); then
        midmon=$LEFT_MON
    else
        leftmon=$LEFT_MON
    fi
    if $(xrandr -q | grep -q $MID_MON | grep -q "0+0"); then
        leftmon=$MID_MON
    else
        midmon=$MID_MON
    fi
fi

xrandr \
    --output $midmon $MID_MON_ARGS \
    --output $leftmon $LEFT_MON_ARGS \
    --output eDP-1 --off

# leftmon="DVI-I-2-1"
# midmon="DVI-I-3-2"

# xrandr \
#     --output $leftmon $leftmon_args_work \
#     --output $midmon $midmon_args_work \
#     --output eDP-1 --off




