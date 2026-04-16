#!/bin/bash

OVPN=$(which openvpn3)

# Get the session status
SESSION_OUTPUT=$("${OVPN}" sessions-list 2>/dev/null)

# Check if no sessions exist
if echo "${SESSION_OUTPUT}" | grep -q "No sessions available"; then
    exit 1
fi

# Extract the Status line
STATUS=$(echo "${SESSION_OUTPUT}" | grep "Status:" | sed 's/.*Status:[[:space:]]*//')

if echo "${STATUS}" | grep -qi "Connected"; then
    exit 0
elif echo "${STATUS}" | grep -qi "paused"; then
    exit 1
elif echo "${STATUS}" | grep -qi "authentication failed"; then
    exit 1
else
    exit 1
fi
