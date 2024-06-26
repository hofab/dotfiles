#!/bin/bash

leftmon_args="--mode 2560x1440 --scale 1x1 --pos 0x0"
midmon_args="--mode 2560x1440 --scale 1x1 --pos 2560x0 --primary"

if $(xrandr -q | grep -q DVI); then
    midmon="DVI-I-5-4"
    leftmon="DVI-I-4-3"
    # midmon="DVI-I-2-1"
    # leftmon="DVI-I-3-2"
fi

xrandr \
    --output $leftmon $leftmon_args \
    --output $midmon $midmon_args \
    --output eDP-1 --off
#    --output eDP-1 --mode 2560x1600 --pos 7680x0
