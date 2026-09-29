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

# turn off every connected output except the laptop panel
OTHER_OUTPUTS=$(xrandr --query | awk '/ connected/{print $1}' | grep -v "^${LAPTOP}$")

XRANDR_ARGS=(--fb 3840x2400 --output "${LAPTOP}" ${LAPTOP_MON_ARGS})
for out in ${OTHER_OUTPUTS}; do
    XRANDR_ARGS+=(--output "${out}" --off)
done

echo "${XRANDR_ARGS[@]}"
xrandr "${XRANDR_ARGS[@]}"

source ${SCRIPT_DIR}/../../scripts/set_mouse_speed.sh
