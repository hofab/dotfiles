#!/bin/bash

# check for two monitor setup
xrandr_output=$(xrandr --listactivemonitors)
# two_monitor="`echo $xrandr_output | rg -i 'HDMI-1'`";
# Monitors on DP1-2 and DP1-2
left_mon_connected="`echo $xrandr_output | rg -i 'DVI-I-3-2'`";
#echo $left_mon_connected
mid_mon_connected="`echo $xrandr_output | rg -i 'DVI-I-2-1'`";
#echo $mid_mon_connected
script_path="/home/fhof/.config/i3"
startup_delay=10

# test if string
if [ "$left_mon_connected" ] && [ "$mid_mon_connected" ] ; then
    echo "THREE"
    sleep $startup_delay
    $script_path/triple.sh
# elif [ "$two_monitor" ]; then
#     echo "DUAL"
#     sleep $startup_delay
#     $script_path/dual.sh
else
    echo "SINGLE"
    sleep $startup_delay
    $script_path/single.sh
fi
