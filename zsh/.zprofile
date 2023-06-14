# set EDITOR
export EDITOR=nvim

[ -f "/usr/bin/zsh" ] && export SHELL=/usr/bin/zsh || export SHELL=/usr/bin/bash

alias gg=lazygit

# If running from tty1 start sway
# [ "$(tty)" = "/dev/tty4" ] && exec sway
