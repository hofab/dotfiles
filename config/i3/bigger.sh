#!/bin/bash

old_dpi=$( ./dpi.sh | awk '{print $NF}' )
new_dpi=$(( old_dpi * $1 / 100 ))
shift
./dpi.sh $new_dpi
"$@" &
sleep 2
./dpi.sh $old_dpi

