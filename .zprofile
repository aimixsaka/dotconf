# XDG Directory
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache

# modified, need to export
export XDG_DATA_HOME=~/dotdata
export XDG_STATE_HOME=~/dotstate

# default program
export EDITOR=nvim
export BROWSER=firefox

# sync all envs to systemd program
command -v dbus-update-activation-environment &>/dev/null && \
    dbus-update-activation-environment --systemd --all 2>/dev/null

# alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
