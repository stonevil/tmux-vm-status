#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/shared.sh"

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

vm_status() {
	if command_exists "/Applications/VMware Fusion.app/Contents/Library/vmrun"; then
    VM=$(($VM+`"/Applications/VMware Fusion.app/Contents/Library/vmrun" -T fusion list | awk 'NR==1{print $4}'`))
  fi
	if command_exists "/usr/bin/vmrun"; then
    VM=$(($VM+`"/usr/bin/vmrun" -T ws list | awk 'NR==1{print $4}'`))
  fi
	if command_exists "/usr/bin/VBoxManage"; then
    VM=$(($VM+`/usr/bin/VBoxManage list runningvms | wc -l`))
	fi
  if $VM == ""; then
    VM=0
  fi
}

print_icon() {
	local status=$1
	printf "$vm_icon $status"
}

main() {
	get_icon_settings
	local status=$(vm_status)
	print_icon "$status"
}
main
