#!/usr/bin/env fish

# Usage: j2000_to_utc.fish <timestamp> [unit: s|ms|us|ns]
# Example: j2000_to_utc.fish 2f7faee3
#          j2000_to_utc.fish 796105367125634840 ns

function j2000_to_utc --description 'Convert j2000 value to utc'
    if not set -q argv[1]
        echo "Usage: j2000_to_utc <timestamp> [unit: s|ms|us|ns]"
        return 1
    end

    set input $argv[1]

    if set -q argv[2]
        set unit (string lower (string trim $argv[2]))
    else
        set unit s
    end

    # Convert hex to decimal if needed
    if string match -qr '^0x' $input
        set timestamp (printf "%u\n" (string sub -s 3 $input))
    else if string match -qr '^[0-9a-fA-F]+$' $input
        set timestamp (printf "%u\n" 0x$input)
    else
        set timestamp $input
    end

    # Determine unit scale factor
    switch $unit
        case s
            set scale "1"
        case ms
            set scale "0.001"
        case us
            set scale "0.000001"
        case ns
            set scale "0.000000001"
        case '*'
            echo "Invalid unit: $unit. Use s, ms, us, or ns."
            return 1
    end

    set j2000_epoch 946727930.816

    # Calculate final Unix time using bc (handles floats)
    set unix_time (echo "$j2000_epoch + ($timestamp * $scale)" | bc -l)

    # Convert to UTC time using date
    date -u -d "@$unix_time" +'%Y-%m-%d %H:%M:%S UTC'
end
