#!/bin/bash
#
source ~/.config/i3/mon_config

leftmon_args="--mode 3840x2160 --scale 1x1 --pos 0x0"

if $(xrandr -q | grep -q "eDP1"); then
    leftmon="DP1-2"
fi
if $(xrandr -q | grep -q "DVI-I-3-2"); then
    echo "DVI-I-3-2"
xrandr \
    --output $leftmon $leftmon_args \
    --output eDP1 --mode 1920x1080 --pos 1920x0 \
    --output DP1-1 --off
else
    echo "ELSE"
xrandr \
    --output $leftmon $leftmon_args \
    --output eDP1 --mode 1920x1080 --pos 1920x0
fi
