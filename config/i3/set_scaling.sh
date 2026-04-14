#!/bin/bash

DSP_DIR="${HOME}/.config/display"
count=$(./detect_monitors.sh)

if [ "$count" -eq 1 ]; then
    source "${DSP_DIR}/single.env"
elif [ "$count" -ge 2 ]; then
    source "${DSP_DIR}/dual.env"
else
    echo "No monitors detected."
    exit 1
fi
