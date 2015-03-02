#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/scripts/helpers.sh

vm_icon="#($CURRENT_DIR/scripts/vm_icon.sh)"
vm_status="#($CURRENT_DIR/scripts/vm_status.sh)"
vm_icon_interpolation="\#{vm_icon}"
vm_status_interpolation="\#{vm_status}"

do_interpolation() {
	local string=$1
	local status_interpolated=${string/$vm_status_interpolation/$vm_status}
	local all_interpolated=${status_interpolated/$vm_icon_interpolation/$vm_icon}
	echo $all_interpolated
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
