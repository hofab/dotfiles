#!/bin/bash

set -e

if [ "$1" = 'UP' ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%+
elif [ "$1" = 'DOWN' ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-
else # Mute
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi
