#!/bin/bash

leftmon_args="--mode 1920x1080 --scale 1x1 --pos 0x0"
midmon_args="--mode 1920x1080 --scale 1x1 --pos 1920x0 --primary"

if $(xrandr -q | grep -q DP-1); then
    leftmon="HDMI-1"
    midmon="DP-1"
fi

xrandr \
    --output $leftmon $leftmon_args \
    --output $midmon $midmon_args \
    --output eDP-1 --mode 1920x1080 --pos 3840x0
