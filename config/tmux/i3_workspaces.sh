#!/bin/bash

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
