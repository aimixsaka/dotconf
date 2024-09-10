# XDG Directory
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache

export XDG_CONFIG_HOME XDG_CACHE_HOME

append_path() {
  case ":$PATH:" in
  *:"$1":*) ;;
  *)
    PATH="${PATH:+$PATH:}$1"
    ;;
  esac

  export PATH
}

append_env() {
  local env_name to_add
  env_name="$1"
  to_add="$2"
  delimiter="${3:-:}"
  env_value="$(eval "echo \$$env_name")"
  if [[ -z "$env_value" ]]; then
    eval $env_name=$to_add
  elif [[ "${delimiter}${env_value}${delimiter}" =~ \.*"${delimiter}${to_add}${delimiter}"\.* ]]; then
    :
  else
    eval $env_name="${env_value}${delimiter}${to_add}"
  fi

  export $env_name
}

# modified, need to export
export XDG_DATA_HOME=~/.local/share
append_env XDG_DATA_DIRS "$XDG_DATA_HOME/flatpak/exports/share"
export XDG_STATE_HOME=~/.local/state

# default program
export EDITOR=emacs
export BROWSER=firefox

# envs
## riscv bin
RV_DIR="/home/aimi/workspace/riscv/arch"
export RV_BUILD="/var/lib/archbuild/extra-riscv64"
export RV_CACHE="$RV_DIR/cache"
export RV_PATCH_REPO="$RV_DIR/archriscv-packages"
#export RV_BUILD="$RV_DIR/build"

export RV1="$RV_BUILD/aimi"
export RV2="$RV_BUILD/aimi2"

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

append_path "/opt/flutter/bin"

export WORDCHARS="*?_-.[]~&;!#$%^(){}<>|"

export TEXMFDIST=/usr/share/texmf-dist

# flutter

# lfs
export LFS="/home/aimi/workspace/lfs/lfsroot"

# sync all envs to systemd program
command -v dbus-update-activation-environment &>/dev/null &&
  dbus-update-activation-environment --systemd --all 2>/dev/null
