# alias
fn cl { e:clear -x }
fn ws { cd ~/workspace }
fn grep { |@args| e:grep --color=auto $@args }
fn delete { |@args| e:rm $@args }
fn rm { |@args| e:trash $@args }
fn ll { |@args| e:ls --color=auto -l $@args }
fn ls { |@args| e:ls --color=auto $@args }
fn lst { |@args| e:ls -al --time=birth $@args }
fn lh { |@args| e:ls --color=auto -alh $@args }

# tigervnc lpi4a
fn vnc-lpi4a { e:ssh -v -fL 9901:localhost:5901 lpi4a sleep 10;  vncviewer localhost:9901 }

# minicom
fn lpi4a { sudo env LANG=en_US.UTF-8 minicom --color=on }

# xm router
fn sshxm { e:sshpass -f ~/private/xm_ax6000_ssh_pass.txt ssh xm }

# dmlive
fn dmlive { (get-env _WORKDIR)'/rust/dmlive/target/release/dmlive' }

# pacman;
fn pas { |@args| e:sudo pacman -S $@args }
fn pasi { |@args| e:pacman -Si $@args }
fn pasii { |@args| e:pacman -Sii $@args }
fn pass { |@args| e:pacman -Ss $@args }
fn passq { |@args| e:sudo pacman -Ssq $@args }
fn paq { |@args| e:pacman -Q $@args }
fn paqi { |@args| e:pacman -Qi $@args }
fn paqii { |@args| e:pacman -Qii $@args }
fn paql { |@args| e:pacman -Ql $@args }
fn paqs { |@args| e:pacman -Qs $@args }
fn paqqs { |@args| e:pacman -Qqs $@args }
fn paqo { |@args| e:pacman -Qo $@args }
fn paqqo { |@args| e:pacman -Qqo $@args }
fn paqqdt { |@args| e:pacman -Qqdt $@args }
fn paqk { |@args| e:pacman -Qk $@args }
fn paqkk { |@args| e:pacman -Qkk $@args }
fn paclear { |@args| e:sudo pacman -Rns (pacman -Qqdt) }
fn paf { |@args| e:pacman -F $@args }
fn pafy { |@args| e:sudo pacman -Fy $@args }
fn pafl { |@args| e:pacman -Fl $@args }
fn pau { e:sudo pacman -Syu }
fn par { |@args| e:sudo pacman -Rns $@args }

# paru;
fn prs { |@args| e:paru -S $@args }
fn prss { |@args| e:paru -Ss $@args }
fn prssq { |@args| e:paru -Ssq $@args }
fn prsi { |@args| e:paru -Si $@args }
fn prq { |@args| e:paru -Q $@args }
fn prqi { |@args| e:paru -Qi $@args }
fn prqs { |@args| e:paru -Qs $@args }
fn prqqs { |@args| e:paru -Qqs $@args }
fn prr { |@args| e:paru -Rns $@args }

# systemd;
fn sss { |@args| e:sudo systemctl start  $@args }
fn sdr { systemctl daemon-reload }
fn ssr { |@args| e:sudo systemctl restart  $@args }
fn ssa { |@args| e:systemctl status  $@args }
fn sse { |@args| e:sudo systemctl enable  $@args }
fn ssen { |@args| e:sudo systemctl enable --now $@args }
fn sst { |@args| e:sudo systemctl stop  $@args }
fn blc { |@args| e:bluetoothctl connect  $@args }
fn sch { e:systemctl hibernate }

fn sua { |@args| e:systemctl --user status $@args }
fn suss { |@args| e:systemctl --user start $@args }
fn sust { |@args| e:systemctl --user stop $@args }
fn sur { |@args| e:systemctl --user restart $@args }
fn sudr { e:systemctl --user daemon-reload }
fn sue { |@args| e:systemctl --user enable $@args }
fn suen { |@args| e:systemctl --user enable --now $@args }
#vim="vim -u ~/.vimrc_bak";

# docker;
fn drm { |@args| e:docker rm $@args }
fn drmi { |@args| e:docker rmi $@args }
fn dst { |@args| e:docker stop $@args }
fn dss { |@args| e:docker start $@args }
fn drs { |@args| e:docker restart $@args }
fn di { |@args| e:docker info $@args }
fn db { e:docker build }
fn dp { e:docker ps }
fn dpa { e:docker ps -a  }
fn dil { e:docker image ls }

# default use emacs terminal mode
# alias emacs='emacs -nw';

# NetworkManager
fn nwc { |@args| e:nmcli device wifi connect $@args }
fn nwr { e:nmcli device wifi rescan }
fn nwl { e:nmcli device wifi list }

# some
fn someon { e:bash (get-env HOME)'/some.sh' on }
fn someoff { e:bash (get-env HOME)'/some.sh' off }

# riscv arch
fn rvarch { 
  if ?(grep -E -q '^arch=\(.*?(any|riscv64).*?\)' PKGBUILD) {
    e:sed -i -E -e 's|^arch=\((.*)\)|arch=\(\1 riscv64\)|' PKGBUILD 
  } 
}

fn rvunarch { e:sed -i -E -e 's|^arch=\((.*?)( riscv64)+\)|arch=\(\1\)|' PKGBUILD }

# tmux
fn tmux { cd (get-env _WORKDIR); e:tmux }

fn lg { e:bash ~/login.sh }

# texlive
fn tlmgr { (get-env EXMFDIST)'/scripts/texlive/tlmgr.pl' --usermode }

#edit:add-vars [
#  &ls~=$ls~
#]
