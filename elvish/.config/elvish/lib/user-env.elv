fn add-path {|path|
  if (has-value $paths $path) { nop } else { set paths = (conj $paths $path) }
}

## _WORKDIR
set-env _WORKDIR $E:HOME'/workspace'


## RISC V
var RV_DIR = /home/aimi/workspace/riscv/arch
var RV_BUILD = /var/lib/archbuild/extra-riscv64

set-env RV_BUILD $RV_BUILD
set-env RV_CACHE $RV_DIR'/cache'
set-env RV_PATCH_REPO $RV_DIR'/archriscv-packages'
#export RV_BUILD="$RV_DIR/build"

set-env RV1 $RV_BUILD'/aimi'
set-env RV2 $RV_BUILD'/aimi2'

var RV_BIN = $RV_DIR'/arch-riscv-scripts/bin'
add-path $RV_BIN


## nvim Mason
add-path (get-env HOME)'/.local/share/nvim/mason/bin'


## set locale env implicitly as elvish won't source /etc/profile.d/locale.sh ...
set-env LANG en_US.UTF-8


## nix stuff from /etc/profile.d/nix-daemon.sh
set-env NIX_LINK (get-env HOME)'/.nix-profile'
add-path (get-env NIX_LINK)'/bin'
add-path /nix/var/nix/profiles/default/bin

## XDG env
set-env XDG_DATA_HOME (get-env HOME)'/.local/share'


## editro
set-env EDITOR emacs

## tmp
set-env TMPDIR /tmp
