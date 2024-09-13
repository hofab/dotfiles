#!/usr/bin/env bash

source mon_config
primary_args="--mode 3840x2160 --scale 1x1 --pos 0x0"

xrandr --output $LEFT_MON --off --output $MID_MON --off --output DVI-I-2-2 --off --output DVI-I-1-1 --off --output eDP-1 --mode 2560x1600 --pos 0x0 --primary

# xrandr --output DVI-I-2-1 $primary_args --primary --output DVI-I-3-2 --off --output eDP-1 --off
