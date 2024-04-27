#!/bin/bash
set -euo pipefail
#trap "echo 'error: Script failed: see failed message above'" ERR

##
# INFO level message
##
info() {
    printf "\e[32mINFO: %s\e[0m\n" "$*"
}

##
# WARN level message
##
warn() {
    printf "\e[33mWARN: %s\e[0m\n" "$*"
}

##
# ERROR level message
##
error() {
    printf "\e[31mERROR: %s\e[0m\n" "$*" >&2
    clean 
    exit 1
}

clean() {
	mountpoint -q /bakroot && umount /bakroot
  # NOTE: for cryptdevice
  #[[ -e "/dev/mapper/bak" ]] && cryptsetup close bak
}

# NOTE: for cryptdevice
#PRIVATE_DIR=/home/aimi/private

# NOTE: for cryptdevice
decrypt() {
  # open and mount cryptdevice if not yet
  if ! [[ -e /dev/mapper/bak ]]; then
    base64 -d "$PRIVATE_DIR/pass_base64.txt" | cryptsetup open "$disk" bak ||
      error "Decrypt $disk failed"
  fi
}

## check root permission and if disk part exists
prerun() {
  # check root
  [[ "$EUID" -ne 0 ]] && error "Please run as root"

  disk="$(readlink -e /dev/disk/by-partlabel/bak)"
  [[ -z "$disk" ]] && error "Cannot find bak disk"
  [[ -d /bakroot ]] || mkdir /bakroot

  mountpoint -q /bakroot || mount "$disk" /bakroot
  # NOTE: for cryptdevice
  # decrypt
  # mountpoint -q /bakroot || mount /dev/mapper/bak /bakroot
}

# check if parent subvolume created or not
# may not exist if this is the first backup
precheck() {
  local source_dir="$1" parent_name="$2"
  if ! [[ -d "/bakroot/$parent_name" && -d "/.snapshots/$parent_name" ]]; then
    btrfs subvolume snapshot -r $source_dir /.snapshots/$parent_name &&
      info "'$parent_name' created!"
    btrfs send /.snapshots/$parent_name | btrfs receive /bakroot ||
    error "Unable to Send parent snapshot: '/.snapshots/$parent_name'"
  fi
}

bak() {
  local source_dir="$1" new_name="$2" parent_name="$3"

  precheck "$source_dir" "$parent_name"

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

prerun

# bak root
bak / root-new root
# bak home
bak /home/aimi aimi-new aimi
# bak workspace
bak /home/aimi/workspace home_aimi_workspace-new home_aimi_workspace
# bak /var/lib
bak /var/lib/pacman var_lib_pacma-new var_lib_pacman

rsync -a /var/log/pacman.log /bakroot/
info "'pacman.log' sync ok!"

rsync -a --delete /boot/ /bakroot/boot
info "'boot directory' sync ok!"

clean




## TODO
# ./bak_btrfs.sh [-d|--bak-dir bak-dir] [-m|--map source:dest] 
