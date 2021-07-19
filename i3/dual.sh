#!/bin/bash

leftmon_args="--mode 1920x1200 --scale 1x1 --pos 0x0"

if $(xrandr -q | grep -q HDMI-1); then
    leftmon="HDMI-1"
fi

xrandr --addmode HDMI-1 1920x1200

xrandr \
    --output $leftmon $leftmon_args \
    --output eDP-1 --mode 1920x1080 --pos 1920x0
