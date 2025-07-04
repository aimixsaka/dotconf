set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share

set -gx EDITOR vis
set -gx SHELL /bin/fish

set -gx USE_CCACHE 1
set -gx CCACHE_EXEC /usr/bin/ccache

set -gx BROWSER qutebrowser

append_path $HOME/workspace/shell/bash/scripts

append_path $HOME/go/bin

append_path $HOME/.local/bin

append_path $HOME/.cargo/bin
