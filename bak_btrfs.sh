#!/bin/bash
set -euo pipefail
trap "echo 'error: Script failed: see failed message above'" ERR

##
# INFO level message
##
info() {
    printf "\e[32mINFO: %s\n\e[0m" "$*"
}

##
# WARN level message
##
warn() {
    printf "\e[33mWARN: %s\n\e[0m" "$*"
}

##
# ERROR level message
##
error() {
    printf "\e[31mERROR: %s\n\e[0m" "$*" >&2
    clean 
    exit 1
}

clean() {
    # lsblk | grep bakroot >&/dev/null && umount /bakroot 
	mountpoint -q /bakroot && umount /bakroot
  [[ -e "/dev/mapper/bak" ]] && cryptsetup close bak
}

# run_as_root() {
#   sudo 
# }

PRIVATE_DIR=/home/aimi/private


[[ "$EUID" -ne 0 ]] && error "Please run as root"

disk="$(readlink -e /dev/disk/by-uuid/8b7faef1-ea61-43ca-8b5c-518b48d5ab32)"
[[ -z "$disk" ]] && error "Cannot find bak disk"

# open and mount cryptdevice if not yet
if ! [[ -e /dev/mapper/bak ]]; then
    base64 -d "$PRIVATE_DIR/pass_base64.txt" | cryptsetup open "$disk" bak ||
      error "Decrypt $disk failed"
fi
mountpoint -q /bakroot || mount /dev/mapper/bak /bakroot

bak () {
  local source_dir="$1" new_name="$2" parent_name="$3"
  btrfs subvolume snapshot -r $source_dir /.snapshots/$new_name ||
      error "Unable to create subvolume '/.snapshots/$new_name'"
  btrfs send -p /.snapshots/$parent_name /.snapshots/$new_name | btrfs receive /bakroot ||
      error "Unable to Send snapshot for '/.snapshots/$new_name'"
  btrfs subvolume delete "/.snapshots/$parent_name"
  mv "/.snapshots/$new_name" "/.snapshots/$parent_name"

  btrfs subvolume delete "/bakroot/$parent_name"
  mv "/bakroot/$new_name" "/bakroot/$parent_name"
  info "'$source_dir' directory bak ok!"
}

# bak root
bak / root-new root

# bak home
bak /home home-new home

# bak workspace
bak /home/aimi/workspace home_aimi_workspace-new home_aimi_workspace

rsync -a /var/log/pacman.log /bakroot/
info "'pacman.log' sync ok!"

rsync -a --delete /boot/ /bakroot/boot
info "'boot directory' sync ok!"

clean




## TODO
# ./bak_btrfs.sh [-d|--bak-dir bak-dir] [-m|--map source:dest] 
