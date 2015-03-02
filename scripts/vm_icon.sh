#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
vm_icon=""

vm_default="VM "
vm_default_osx="⧉ "

vm_default() {
	if is_osx; then
		echo "$vm_default_osx"
	else
		echo "$vm_default"
	fi
}

# icons are set as script global variables
get_icon_settings() {
	vm_icon=$(get_tmux_option "@vm_icon" "$(vm_default)")
}

main() {
	get_icon_settings
  printf "$vm_icon"
}
main
