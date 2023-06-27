#!/bin/bash

echo "TRI-SCRIPT"

leftmon_args="--mode 3840x2160 --scale 1x1 --pos 0x0"
midmon_args="--mode 3840x2160 --scale 1x1 --pos 3840x0 --primary"

if $(xrandr -q | grep -q DVI); then
    leftmon="DVI-I-2-2"
    midmon="DVI-I-1-1"
    # midmon="DVI-I-2-1"
    # leftmon="DVI-I-3-2"
fi

xrandr \
    --output $leftmon $leftmon_args \
    --output $midmon $midmon_args \
    --output eDP-1 --off