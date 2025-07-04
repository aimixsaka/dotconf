[[ -f "$HOME/.config/zsh/.zshlib" ]] && source "$HOME/.config/zsh/.zshlib"

# XDG Directory
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache

export XDG_CONFIG_HOME XDG_CACHE_HOME



# modified, need to export
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

# default program
export EDITOR=nvim

# envs
## riscv bin
RV_DIR="/home/aimi/workspace/riscv/arch"
export RV_BUILD="/var/lib/archbuild/extra-riscv64"
export RV_CACHE="$RV_DIR/cache"
export RV_PATCH_REPO="$RV_DIR/archriscv-packages"
#export RV_BUILD="$RV_DIR/build"

export RV1="$RV_BUILD/aimi"
export RV2="$RV_BUILD/aimi2"

# personal scripts
append_path "$HOME/workspace/shell/bash/scripts"

RV_BIN="$RV_DIR/arch-riscv-scripts/bin"
append_path "$RV_BIN"

GO_BIN="$HOME/go/bin"
append_path "$GO_BIN"

DOOM_BIN="$XDG_CONFIG_HOME/emacs/bin"
append_path "$DOOM_BIN"

MASON_BIN="$XDG_DATA_HOME/nvim/mason/bin"
append_path "$MASON_BIN"

PIPX_BIN="$HOME/.local/bin"
append_path "$PIPX_BIN"

CARGO_BIN="$HOME/.cargo/bin"
append_path "$CARGO_BIN"


# moonbit
append_path "$HOME/.moon/bin"
append_path "$XDG_DATA_HOME/lsp/moonbit/bin"

# plan9
PLAN9=/home/aimi/.local/plan9
append_path "$PLAN9/bin"

export WORDCHARS="*?_-.[]~&;!#$%^(){}<>|"

export TEXMFDIST=/usr/share/texmf-dist

# android
export ANDROID_HOME=$HOME/Android/Sdk

# flutter
append_path $HOME/flutter_sdk/flutter/bin
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

# lfs
export LFS="/home/aimi/workspace/lfs/lfsroot"

# cache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

# term
export TERM=alacritty
# sync all envs to systemd program
command -v dbus-update-activation-environment &>/dev/null &&
  dbus-update-activation-environment --systemd --all 2>/dev/null
