#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_vm_status() {
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

main() {
  print_vm_status
}
main
