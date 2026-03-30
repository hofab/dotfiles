#!/bin/bash

output=$(winedbg --command "info proc")

# Extract the line containing 'crossstudio.exe'
crossstudio_line=$(echo "$output" | grep 'crossstudio.exe')

# Extract the hex number in front of 'crossstudio.exe'
hex_number=$(echo "$crossstudio_line" | awk '{print $1}')

# Convert the hex number to a decimal number
decimal_number=$((16#$hex_number))

winedbg --command "attach $(decimal_number) && kill"

# Output the decimal number
echo "The decimal number for crossstudio.exe is: $decimal_number"
