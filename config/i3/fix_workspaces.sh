#!/bin/bash

# Read your monitor names
source ~/.config/i3/get_edid.sh

# see https://www.reddit.com/r/i3wm/comments/f21jxx/why_wrong_i3ipc_socket_number_when_i3msg/
I3SOCK=$(i3 --get-socket)

leftmon=$LEFT_MON
rightmon=$RIGHT_MON

# Move left monitor workspaces
i3-msg "workspace number 2; move workspace to output $leftmon"
i3-msg "workspace number 4; move workspace to output $leftmon"
i3-msg "workspace number 6; move workspace to output $leftmon"
i3-msg "workspace number 8; move workspace to output $leftmon"

# Move right monitor workspaces
i3-msg "workspace number 1; move workspace to output $rightmon"
i3-msg "workspace number 3; move workspace to output $rightmon"
i3-msg "workspace number 5; move workspace to output $rightmon"
i3-msg "workspace number 7; move workspace to output $rightmon"
i3-msg "workspace number 9; move workspace to output $rightmon"
