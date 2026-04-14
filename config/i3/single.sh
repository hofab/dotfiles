#!/usr/bin/env bash

source ~/.config/i3/mon_config
source ~/.config/i3/get_edid.sh

xrandr  --output ${LEFT_MON} --off \
        --output ${RIGHT_MON} --off \
        --output ${LAPTOP} ${LAPTOP_MON_ARGS}

