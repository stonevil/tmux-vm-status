# Tmux Virtual Machines status

Tmux plugin that show the number of the started VMware Fusion / Workstation AND/OR VirtualBox virtual machines status.

Introduces a new `#{vm_status}` format.

This plugin is useful if:
- run a lot virtual machines with Vagrant/Packer and forget about this.

### Usage

Add `#{vm_icon}` and `#{vm_status}` format string to your existing `status-right` tmux option.

Here's the examples in `.tmux.conf`:

    set -g status-right "#{vm_status} | %a %h-%d %H:%M "

#### Configure icons
If the icons don't display well on your machine you can change them in
`.tmux.conf`:

    set -g @vm_icon "Virtual Machines"

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins "                 \
      tmux-plugins/tpm                    \
      stonevil/tmux-vm-status             \
    "

Hit `prefix + I` to fetch the plugin and source it.

`#{vm_status}` interpolation should now work.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/stonevil/tmux-vm-status ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/vm_status.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

`#{vm_status}` interpolation should now work.

### Limitations

Virtual Machines status icon most likely won't be instant. The duration depends on the `status-interval` Tmux option. So, it might take anywhere between 5 and 60 seconds for vm status icon to change.

Set `status-interval` to a low number to make this faster, example:

    # in .tmux.conf
    set -g status-interval 5

### Other plugins

You might also find these useful:

- [wan-status](https://github.com/stonevil/tmux-wan-status) - WAN status and IP
- [lan-status](https://github.com/stonevil/tmux-lan-status) - LAN status and IP

### License

[MIT](LICENSE.md)
