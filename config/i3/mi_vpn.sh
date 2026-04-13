#!/bin/bash

if openvpn3 sessions-list | grep -q "No sessions available"; then
    exit 1
else
    if openvpn3 sessions-list | grep -q "paused"; then
        exit 1
    fi
    exit 0
fi
