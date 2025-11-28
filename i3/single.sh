#!/usr/bin/env bash

source ~/.config/i3/mon_config
source ~/.config/i3/get_edid.sh

primary_args="--mode 3840x2160 --scale 1x1 --pos 0x0"

echo "TESTING" >> /tmp/log.log
echo "$LEFT_MON" >> /tmp/log.log
echo "$RIGHT_MON" >> /tmp/log.log

xrandr --output ${LEFT_MON} --off \
    --output ${RIGHT_MON} --off \
    --output eDP-1 --mode 2560x1600 --pos 0x0 --primary

# --output DVI-I-2-2 --off --output DVI-I-1-1 --off

# xrandr --output DVI-I-2-1 $primary_args --primary --output DVI-I-3-2 --off --output eDP-1 --off
