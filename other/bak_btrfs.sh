#!/bin/bash
set -euo pipefail
#trap "echo 'error: Script failed: see failed message above'" ERR


BACKUP_ROOT=/mnt/bakroot

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
	mountpoint -q $BACKUP_ROOT && umount $BACKUP_ROOT
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

  disk="$(readlink -e /dev/disk/by-partlabel/data)"
  [[ -z "$disk" ]] && error "Cannot find bak disk"
  [[ -d $BACKUP_ROOT ]] || mkdir $BACKUP_ROOT

  mountpoint -q $BACKUP_ROOT || mount "$disk" $BACKUP_ROOT
  # NOTE: for cryptdevice
  # decrypt
  # mountpoint -q $BACKUP_ROOT || mount /dev/mapper/bak $BACKUP_ROOT
}

# check if parent subvolume created or not
# may not exist if this is the first backup
precheck() {
  local source_dir="$1" parent_name="$2"
  if ! [[ -d "$BACKUP_ROOT/$parent_name" && -d "/.snapshots/$parent_name" ]]; then
    btrfs subvolume snapshot -r $source_dir /.snapshots/$parent_name &&
      info "'$parent_name' created!"
    btrfs send /.snapshots/$parent_name | pv | btrfs receive $BACKUP_ROOT/ ||
    error "Unable to Send parent snapshot: '/.snapshots/$parent_name'"
  fi
}

bak() {
  local source_dir="$1" new_name="$2" parent_name="$3"

  precheck "$source_dir" "$parent_name"

  btrfs subvolume snapshot -r $source_dir /.snapshots/$new_name ||
    error "Unable to create subvolume '/.snapshots/$new_name'"
  btrfs send -p /.snapshots/$parent_name /.snapshots/$new_name | pv | btrfs receive $BACKUP_ROOT/ ||
    error "Unable to Send snapshot for '/.snapshots/$new_name'"
  btrfs subvolume delete "/.snapshots/$parent_name"
  mv "/.snapshots/$new_name" "/.snapshots/$parent_name"

  btrfs subvolume delete "$BACKUP_ROOT/$parent_name"
  mv "$BACKUP_ROOT/$new_name" "$BACKUP_ROOT/$parent_name"
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

rsync -a /var/log/pacman.log $BACKUP_ROOT/
info "'pacman.log' sync ok!"

rsync -a --delete /boot/ $BACKUP_ROOT/boot
info "'boot directory' sync ok!"


## TODO
# ./bak_btrfs.sh [-d|--bak-dir bak-dir] [-m|--map source:dest] 
