#!/bin/bash

# Configuration
EXEC="brightness.sh"
DISPLAY_NAME="eDP-1"
STEP="0.1"

# assume that both scripts are in the same path
SCRIPT=$(realpath -s "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

# fail if script can't be found
if [ ! -f ${SCRIPT_PATH}/${EXEC} ]; then
    exit 1
fi


# Check argument
if [ "$1" == "UP" ]; then
    ${SCRIPT_PATH}/${EXEC} + "$DISPLAY_NAME" "$STEP"
elif [ "$1" == "DOWN" ]; then
    ${SCRIPT_PATH}/${EXEC} - "$DISPLAY_NAME" "$STEP"
else
    echo "Usage: $0 [UP|DOWN]"
    exit 1
fi

