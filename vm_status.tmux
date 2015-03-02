#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

vm_status_icon="#($CURRENT_DIR/scripts/vm_status_icon.sh)"

source $CURRENT_DIR/scripts/shared.sh

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
