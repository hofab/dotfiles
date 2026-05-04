#!/bin/bash

DEVICE_NAME="Logitech M510"

# Check if the device is connected
if xinput list | grep -q "$DEVICE_NAME"; then
    echo "✔ Found device: $DEVICE_NAME"
    xinput --set-prop "$DEVICE_NAME" "libinput Accel Speed" 0.9
    echo "✔ Accel Speed set to 1.0"
else
    echo "✘ Device '$DEVICE_NAME' not found."
    echo ""
    echo "Available pointer devices:"
    xinput list --name-only
fi
