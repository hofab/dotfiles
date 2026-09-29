#!/usr/bin/env bash

# helper functions
get_script_dir() {
    local script_path
    script_path="$(readlink -f "${BASH_SOURCE[1]}" 2>/dev/null || readlink -f "$0" 2>/dev/null)"

    if [ -n "$script_path" ]; then
        dirname "$script_path"
    else
        pwd
    fi
}
# extract script dir
SCRIPT_DIR="$(get_script_dir)"

. ${SCRIPT_DIR}/mon_config
source ${SCRIPT_DIR}/get_edid.sh

if [[ ! -z ${RIGHT_MON} ]]; then
    if [[ ! -z ${LEFT_MON} ]]; then
        xrandr \
            --output ${LAPTOP} --off \
            --output $RIGHT_MON $RIGHT_MON_ARGS \
            --output $LEFT_MON $LEFT_MON_ARGS
    fi
fi

sleep 5

source ${SCRIPT_DIR}/fix_workspaces.sh
source ${SCRIPT_DIR}/../../scripts/set_mouse_speed.sh







