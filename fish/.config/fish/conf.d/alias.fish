## workdir
set -g _WORKDIR "/home/aimi/workspace"

## aliases

alias nv "nvim"
alias ws "cd ~/workspace"
alias rm "trash"
alias del "/usr/bin/rm"

alias l "ls -l"
alias lst "ls -al --time birth"
alias lh "ls -alh"

alias vis "env SHELL=bash vis"

# gdb
alias gdb "gdb -q"

# nixvim
alias nixvim "nix run ~/nixvim#full -- "

# tigervnc lpi4a
alias vnc-lpi4a 'ssh -v -fL 9901:localhost:5901 lpi4a sleep 10;  vncviewer localhost:9901'

# minicom
alias lpi4a 'sudo env LANG=en_US.UTF-8 minicom --color on'

# xm router
alias sshxm 'sshpass -f ~/private/xm_ax6000_ssh_pass.txt ssh xm'

# dmlive
alias dmlive '$_WORKDIR/rust/dmlive/target/release/dmlive'

# xwayland detect
alias xwayland extramaus

# alias del "/usr/bin/env rm"
# alias sdel "sudo rm"

# pacman
alias pas "sudo pacman -S"
alias pasi "pacman -Si"
alias pasii "pacman -Sii"
alias pass "pacman -Ss"
alias passq "sudo pacman -Ssq"
alias paq "pacman -Q"
alias paqi "pacman -Qi"
alias paqii "pacman -Qii"
alias paql "pacman -Ql"
alias paqs "pacman -Qs"
alias paqqs "pacman -Qqs"
alias paqo "pacman -Qo"
alias paqqo "pacman -Qqo"
alias paqqdt "pacman -Qqdt"
alias paqqen "pacman -Qqen"
alias paqk "pacman -Qk"
alias paqkk "pacman -Qkk"
alias paclear "sudo pacman -Rns \$(pacman -Qqdt)"
alias paf "pacman -F"
alias pafl "pacman -Fl"
alias pau "sudo pacman -Syu"
alias par "sudo pacman -Rns"

# paru
alias prs "paru -S"
alias prss "paru -Ss"
alias prssq "paru -Ssq"
alias prsi "paru -Si"
alias prq "paru -Q"
alias prqi "paru -Qi"
alias prqs "paru -Qs"
alias prqqs "paru -Qqs"
alias prr "paru -Rns"

# systemd
alias sss "sudo systemctl start "
alias sdr "sudo systemctl daemon-reload"
alias ssr "sudo systemctl restart "
alias ssa "systemctl status "
alias sse "sudo systemctl enable "
alias ssd "sudo systemctl disable"
alias ssen "sudo systemctl enable --now"
alias ssdn "sudo systemctl disable --now"
alias sst "sudo systemctl stop "
alias blc "bluetoothctl connect "
alias sch "systemctl hibernate"
alias scs "systemctl suspend"
alias sct "systemctl cat"

alias sua "systemctl --user status"
alias suss "systemctl --user start"
alias sust "systemctl --user stop"
alias sur "systemctl --user restart"
alias sudr "systemctl --user daemon-reload"
alias sue "systemctl --user enable"
alias suen "systemctl --user enable --now"
alias suct "systemctl --user cat"
#vim "vim -u ~/.vimrc_bak"

# docker
alias drm "docker rm"
alias drmi "docker rmi"
alias dst "docker stop"
alias dss "docker start"
alias drs "docker restart"
alias di "docker info"
alias db "docker build"
alias dp "docker ps"
alias dpa "docker ps -a "
alias dil "docker image ls"

# xray
alias xsr "ssr xray.service nftables.service"
#xst "sst xray.service nftables.service"
alias vre "sudo $_WORKDIR/xray/xray_tool.sh vre"
alias vtp "sudo $_WORKDIR/xray/xray_tool.sh vtp"
alias xre "sudo $_WORKDIR/xray/xray_tool.sh xre"
alias xtp "sudo $_WORKDIR/xray/xray_tool.sh xtp"
alias xinfo "sudo $_WORKDIR/xray/xray_tool.sh info"
alias xst "sudo $_WORKDIR/xray/xray_tool.sh stop"
alias xtohk "sudo $_WORKDIR/xray/xray_tool.sh xtohk"
alias xtojp "sudo $_WORKDIR/xray/xray_tool.sh xtojp"

# NetworkManager
alias nwc "nmcli device wifi connect"
alias nwr "nmcli device wifi rescan"
alias nwl "nmcli device wifi list"

# some
alias someon "$HOME/some.sh on"
alias someoff "$HOME/some.sh off"

# riscv arch
alias rvarch "! grep -E -q '^arch \(.*?(any|riscv64).*?\)' PKGBUILD && sed -i -E -e 's|^arch \((.*)\)|arch \(\1 riscv64\)|' PKGBUILD"
alias rvunarch "sed -i -E -e 's|^arch \((.*?)( riscv64)+\)|arch \(\1\)|' PKGBUILD"
