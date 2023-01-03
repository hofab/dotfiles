#!/bin/bash

leftmon_args="--mode 1920x1200 --scale 1x1 --pos 0x0"

if $(xrandr -q | grep -q eDP1); then
    leftmon="DP1-2"
fi
if $(xrandr -q | grep -q DP1-1); then
    echo "DP1-2"
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

