#!/bin/bash

set -e

if [ "$1" = 'UP' ]; then
    for i in `pacmd list-sinks | grep "index:" | cut -b12-`; do
        pactl set-sink-volume "$i" "+4%";
    done
elif [ "$1" = 'DOWN' ]; then
    for i in `pacmd list-sinks | grep "index:" | cut -b12-`; do
        pactl set-sink-volume "$i" "-4%";
    done
else # Mute
    for i in `pacmd list-sinks | grep "index:" | cut -b12-`; do
        pactl set-sink-mute "$i" toggle
    done
fi

