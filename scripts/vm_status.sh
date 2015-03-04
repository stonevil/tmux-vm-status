#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

vm_option_string="@vm_icon"

vm_icon_osx="⧉ "
vm_icon="VM "

vm_icon_default() {
	if is_osx; then
		echo "$vm_icon_osx"
	else
		echo "$vm_icon"
	fi
}

vm_count() {
  VM="0"
	if is_osx; then
    if [[ -d '/Applications/VMware Fusion.app' ]]; then
      VM=$(($VM+`"/Applications/VMware Fusion.app/Contents/Library/vmrun" -T fusion list | awk 'NR==1{print $4}'`))
    fi
  fi

	if is_linux; then
    if command_exists "vmrun"; then
      VM=$(($VM+`vmrun -T ws list | awk 'NR==1{print $4}'`))
    fi
  fi

	if command_exists "VBoxManage"; then
    VM=$(($VM+`VBoxManage list runningvms | wc -l`))
	fi

  echo "$VM"
}

print_vm_status() {
	# spacer fixes weird emoji spacing
	local spacer=" "
  if [ $(vm_count) -ne 0 ]; then
    printf "$(get_tmux_option "$vm_option_string" "$(vm_icon_default)")$spacer$(vm_count)"
	fi
}

main() {
  print_vm_status
}
main
