#!/bin/bash

##
# INFO level message
##
info() {
    printf "\e[32mINFO: %s\n\e[0m" "$@"
}

##
# WARN level message
##
warn() {
    printf "\e[33mWARN: %s\n\e[0m" "$@"
}

##
# ERROR level message
##
error() {
    printf "\e[31mERROR: %s\n\e[0m" "$@"
    clean 
    exit 1
}

clean() {
    lsblk | grep bakroot >&/dev/null && umount /bakroot 
    [[ -e "/dev/mapper/bak" ]] && cryptsetup close bak
}


[[ "$EUID" -ne 0 ]] && error "Please run as root"

disk="$(blkid | grep "8b7faef1-ea61-43ca-8b5c-518b48d5ab32" | cut -d: -f1)"
if [[ -z "$disk" ]]; then
    error "Cannot find bak disk"
fi

# crypt open and mount if not yet
[[ -e /dev/mapper/bak ]] || cryptsetup open "$disk" bak
mountpoint -q /bakroot || mount /dev/mapper/bak /bakroot

btrfs subvolume snapshot -r /home /.snapshots/home-new ||
    error "Unable to create subvolume /.snapshots/home-new"

btrfs send -p /.snapshots/home /.snapshots/home-new | btrfs receive /bakroot ||
    error "Unable to Send snapshot for home"

btrfs subvolume delete /.snapshots/home
mv /.snapshots/home-new /.snapshots/home

btrfs subvolume delete /bakroot/home
mv /bakroot/home-new /bakroot/home
info "home directory bak ok!"

btrfs subvolume snapshot -r / /.snapshots/root-new ||
    error "Unable to create subvolume /.snapshots/home-new"

btrfs send -p /.snapshots/root /.snapshots/root-new | btrfs receive /bakroot ||
    error "Unable to Send snapshot for home"

btrfs subvolume delete /.snapshots/root
mv /.snapshots/root-new /.snapshots/root

btrfs subvolume delete /bakroot/root
mv /bakroot/root-new /bakroot/root
info "root directory bak ok!"

rsync -a --delete /boot/ /bakroot/boot
info "boot directory sync ok!"

clean
