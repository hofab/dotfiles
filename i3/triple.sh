#!/usr/bin/env bash

echo "TRI-SCRIPT"

. ~/.config/i3/mon_config

if [[ ! -n ${LEFT_MON} ]]; then
    if [[ ! -n ${MID_MON} ]]; then
        exit 0
    fi
fi

if $(xrandr -q | grep -q DVI); then
    if $(xrandr -q | grep -q ${LEFT_MON} | grep -q "3840+0"); then
        midmon=${LEFT_MON}
    else
        leftmon=${LEFT_MON}
    fi
    if $(xrandr -q | grep -q ${MID_MON} | grep -q "0+0"); then
        leftmon=${MID_MON}
    else
        midmon=${MID_MON}
    fi
fi

if [[ ! -z ${midmon} ]]; then
    if [[ ! -z ${leftmon} ]]; then
        xrandr \
            --output $midmon $MID_MON_ARGS \
            --output $leftmon $LEFT_MON_ARGS \
            --output eDP-1 --off
    fi
fi




