#!/bin/bash

if nmcli con show --active | grep -q "sfl-"; then
    exit 0
else
    exit 1
fi
