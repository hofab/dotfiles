#!/bin/bash

b=$(xbacklight -get)
b=${b%.*}


if [ "$1" = 'UP' ]; then
    if [ $b -lt 5 ]; then
        i=1;
    else
        i=5;
    fi 
    xbacklight -inc $i -steps 1 -time 0
else
    if [ $b -le 5 ]; then
        i=1;
    else
        i=5;
    fi 
    xbacklight -dec $i -steps 1 -time 0
fi

cat /sys/class/backlight/nvidia_0/actual_brightness | sudo /usr/bin/tee /sys/class/backlight/nvidia_0/brightness

