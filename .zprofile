# XDG Directory
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache

# modified, need to export
export XDG_DATA_HOME=~/.local/share
export XDG_DATA_DIRS="$XDG_DATA_HOME/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_STATE_HOME=~/.local/state

# default program
export EDITOR=nvim
export BROWSER=firefox

# envs
## workdir
export WORKDIR="/home/aimi/workspace"
## riscv bin
RV_DIR="/home/aimi/workspace/riscv/arch"
export RV_BUILD="/var/lib/archbuild/extra-riscv64"
export RV_CACHE="$RV_DIR/cache"
export RV_PATCH_REPO="$RV_DIR/archriscv-packages"
#export RV_BUILD="$RV_DIR/build"

export RV1="$RV_BUILD/aimi"
export RV2="$RV_BUILD/aimi2"

RV_BIN="$RV_DIR/scripts/bin"
export PATH="$RV_BIN:$PATH"

MASON_BIN="$XDG_DATA_HOME/nvim/mason/bin"
export PATH="$MASON_BIN:$PATH"
# sync all envs to systemd program
command -v dbus-update-activation-environment &>/dev/null && \
    dbus-update-activation-environment --systemd --all 2>/dev/null

# alias
alias config='/usr/bin/git --git-dir=$HOME/dotconf/.git --work-tree=$HOME'
