#!/bin/bash

# Usage: ./j2000_to_utc.sh <timestamp> [unit]
# unit: s (default), ms, us, ns

input="$1"
unit="${2:-s}"  # default to seconds if not provided

# Validate input
if [[ -z "$input" ]]; then
    echo "Usage: $0 <timestamp> [unit: s|ms|us|ns]"
    exit 1
fi

# Convert hex to decimal if needed
if [[ "$input" == 0x* ]]; then
    timestamp=$((input))
elif [[ "$input" =~ ^[0-9a-fA-F]+$ ]]; then
    timestamp=$((16#$input))
else
    timestamp=$input
fi

# Scale timestamp to seconds
case "$unit" in
    s)  scale="1";;
    ms) scale="0.001";;
    us) scale="0.000001";;
    ns) scale="0.000000001";;
    *)
        echo "Invalid unit: $unit. Use s, ms, us, or ns."
        exit 1
        ;;
esac

j2000_epoch=946727930.816


# Compute full UNIX timestamp
unix_time=$(echo "$j2000_epoch + ($timestamp * $scale)" | bc -l)

# Format output in 24-hour ISO style
date -u -d "@$unix_time" +'%Y-%m-%d %H:%M:%S UTC'

