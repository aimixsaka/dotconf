# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zpcompinit; zpcdreplay

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
# zsh-fzf-history-search
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search
# p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
# Snippet


# set fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--color=selected-bg:#bcc0cc \
--multi"


#--------------------------
## Personal Config 
#--------------------------
bindkey -e

## workdir
_WORKDIR="/home/aimi/workspace"

## aliases

alias nv="nvim";
alias cl="clear -x";
alias ws="cd ~/workspace";
alias grep="grep --color=auto"
alias rm="trash"
alias del="/usr/bin/rm"

alias l="ls --color=auto -l";
alias ls="ls --color=auto";
alias lst="ls -al --time=birth";
alias lh="ls --color=auto -alh"

# gdb
alias gdb="gdb -q"

# nixvim
alias nixvim="nix run ~/nixvim#full -- "

# tigervnc lpi4a
alias vnc-lpi4a='ssh -v -fL 9901:localhost:5901 lpi4a sleep 10;  vncviewer localhost:9901'

# minicom
alias lpi4a='sudo env LANG=en_US.UTF-8 minicom --color=on'

# xm router
alias sshxm='sshpass -f ~/private/xm_ax6000_ssh_pass.txt ssh xm'

# dmlive
alias dmlive='$_WORKDIR/rust/dmlive/target/release/dmlive'

# xwayland detect
alias xwayland=extramaus

# alias del="/usr/bin/env rm"
# alias sdel="sudo rm"

# pacman
alias pas="sudo pacman -S"
alias pasi="pacman -Si"
alias pasii="pacman -Sii"
alias pass="pacman -Ss"
alias passq="sudo pacman -Ssq"
alias paq="pacman -Q"
alias paqi="pacman -Qi"
alias paqii="pacman -Qii"
alias paql="pacman -Ql"
alias paqs="pacman -Qs"
alias paqqs="pacman -Qqs"
alias paqo="pacman -Qo"
alias paqqo="pacman -Qqo"
alias paqqdt="pacman -Qqdt"
alias paqqen="pacman -Qqen"
alias paqk="pacman -Qk"
alias paqkk="pacman -Qkk"
alias paclear="sudo pacman -Rns \$(pacman -Qqdt)"
alias paf="pacman -F"
alias pafl="pacman -Fl"
alias pau="sudo pacman -Syu"
alias par="sudo pacman -Rns"

# paru
alias prs="paru -S"
alias prss="paru -Ss"
alias prssq="paru -Ssq"
alias prsi="paru -Si"
alias prq="paru -Q"
alias prqi="paru -Qi"
alias prqs="paru -Qs"
alias prqqs="paru -Qqs"
alias prr="paru -Rns"

# systemd
alias sss="sudo systemctl start "
alias sdr="sudo systemctl daemon-reload"
alias ssr="sudo systemctl restart "
alias ssa="systemctl status "
alias sse="sudo systemctl enable "
alias ssd="sudo systemctl disable"
alias ssen="sudo systemctl enable --now"
alias ssdn="sudo systemctl disable --now"
alias sst="sudo systemctl stop "
alias blc="bluetoothctl connect "
alias sch="systemctl hibernate"
alias scs="systemctl suspend"
alias sct="systemctl cat"

alias sua="systemctl --user status"
alias suss="systemctl --user start"
alias sust="systemctl --user stop"
alias sur="systemctl --user restart"
alias sudr="systemctl --user daemon-reload"
alias sue="systemctl --user enable"
alias suen="systemctl --user enable --now"
#vim="vim -u ~/.vimrc_bak"

# docker
alias drm="docker rm"
alias drmi="docker rmi"
alias dst="docker stop"
alias dss="docker start"
alias drs="docker restart"
alias di="docker info"
alias db="docker build"
alias dp="docker ps"
alias dpa="docker ps -a "
alias dil="docker image ls"

# xray
alias xsr="ssr xray.service nftables.service"
#xst="sst xray.service nftables.service"
alias vre="sudo $_WORKDIR/xray/xray_tool.sh vre"
alias vtp="sudo $_WORKDIR/xray/xray_tool.sh vtp"
alias xre="sudo $_WORKDIR/xray/xray_tool.sh xre"
alias xtp="sudo $_WORKDIR/xray/xray_tool.sh xtp"
alias xinfo="sudo $_WORKDIR/xray/xray_tool.sh info"
alias xst="sudo $_WORKDIR/xray/xray_tool.sh stop"
alias xtohk="sudo $_WORKDIR/xray/xray_tool.sh xtohk"
alias xtojp="sudo $_WORKDIR/xray/xray_tool.sh xtojp"

# NetworkManager
alias nwc="nmcli device wifi connect"
alias nwr="nmcli device wifi rescan"
alias nwl="nmcli device wifi list"

# some
alias someon="$HOME/some.sh on"
alias someoff="$HOME/some.sh off"

# riscv arch
alias rvarch="! grep -E -q '^arch=\(.*?(any|riscv64).*?\)' PKGBUILD && sed -i -E -e 's|^arch=\((.*)\)|arch=\(\1 riscv64\)|' PKGBUILD"
alias rvunarch="sed -i -E -e 's|^arch=\((.*?)( riscv64)+\)|arch=\(\1\)|' PKGBUILD"

alias lg="bash ~/login.sh"

# texlive
alias tlmgr="$TEXMFDIST/scripts/texlive/tlmgr.pl --usermode"

# yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# emacs
em() {
  f="$1"
  [[ -r "$f" ]] && emacsclient -t "$f" ||
	  emacsclient -t -e "(find-file \"/sudo::$f\")"
}

# tmux
tmw() {
  tmux split-window -dh "$@"
}

runcpp() {
    content="$1"
    cat <<EOF | g++ -xc++ - && { [[ -e ./a.out ]] && ./a.out && rm ./a.out }
#include <bits/stdc++.h>
using namespace std;
int main() 
{
    $1 
    return 0; 
}
EOF
}

buildasm() {
    filename="${1%%.*}"
    nasm -g -f elf64 -o "$filename".o "$1" &&
    ld -o "$filename" "$filename".o
}

winrar() {
}

loop() {
  cmd="$@"
  times="${2:-10}"
  sleep_time="${3:-1.5}"
  while ! eval "$cmd" && ((times >= 0)); do
    eval "$cmd"
    sleep $sleep_time
    times=$((times - 1))
  done
}

proxy_set_env() {
    local protocol=$1 ip=$2 port=$3
    export http_proxy=$protocol://$ip:$port
    export HTTP_PROXY=$protocol://$ip:$port
    export https_proxy=$protocol://$ip:$port
    export HTTPS_PROXY=$protocol://$ip:$port
    export term_proxy_status="on"
}

proxy() {
    local switch=$1
    local protocol=${2:-http}
    local port=${3:-2842}
    local ip=127.0.0.1
    if [[ "$switch" == "on" ]]; then
        proxy_set_env $protocol $ip $port
    elif [[ "$switch" == "off" ]]; then
        unset http_proxy
        unset HTTP_PROXY
        unset https_proxy
        unset HTTPS_PROXY
        export term_proxy_status="off"
    elif [[ "$switch" == "status" ]]; then
        echo "status: ${term_proxy_status:-off}"
    elif [[ "$switch" == "v2raya" ]]; then
        ip=192.168.1.1
        proxy_set_env $protocol $ip $port
    else
        echo "Unknown option: $switch"
    fi
}

# load autojump
[[ -e /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh


setopt interactivecomments
setopt hist_ignore_all_dups
# do not record a command to .zhistory 
# if it starts with a sapce
setopt hist_ignore_space

# set history size
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zhistory

setopt autocd

# default to turn proxy on
#proxy on

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
