#!/bin/bash
count=$(xrandr | grep -c ' connected')
monitors=$(xrandr | grep ' connected' | awk '{print $1}')

echo "${count}"
