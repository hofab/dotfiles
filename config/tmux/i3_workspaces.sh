#!/bin/bash

# see https://www.reddit.com/r/i3wm/comments/f21jxx/why_wrong_i3ipc_socket_number_when_i3msg/
I3SOCK=$(i3 --get-socket)

i3-msg -t get_workspaces | python3 -c "
import json, sys
workspaces = json.load(sys.stdin)
parts = []
for ws in workspaces:
    name = ws['name']
    if ws['focused']:
        parts.append(f'[{name}]')
    else:
        parts.append(name)
print(' '.join(parts))
"
