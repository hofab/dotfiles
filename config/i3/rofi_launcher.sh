#!/usr/bin/env bash

ENV_PATH="$HOME/.config/display"

monitor_count=$(xrandr --listmonitors | head -1 | awk '{print $2}')

if [ "$monitor_count" -ge 2 ]; then
    source ${ENV_PATH}/dual.env
else
    source ${ENV_PATH}/single.env
fi

# Rofi run menu with a fallback theme and matching mode
rofi -show combi -modes combi -combi-modes "window,drun,run" -show-icons -theme ~/.config/rofi/mytheme.rasi
