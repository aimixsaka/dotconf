#!/usr/bin/zsh

cd ~

export _JAVA_AWT_WM_NONREPARENTING=1
# java application font
#export XCURSOR_SIZE=24
# vapau
#export VDPAU_TRACE=2
#export VDPAU_NVIDIA_DEBUG=3
#export VDPAU_TRACE_FILE=vdpau.log
#export VDPAU_DRIVER=nvidia

# nvidia
#export LIBVA_DRIVER_NAME=nvidia
#export XDG_SESSION_TYPE=wayland

# intel
# use iHD driver for vaapi
export LIBVA_DRIVER_NAME=iHD

# firefox for wayland
export MOZ_ENABLE_WAYLAND=1

# Force GBM as the wayland backend
#export GBM_BACKEND=nvidia-drm
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

# hyprland
# fix mouse dispear under nvidia
export WLR_NO_HARDWARE_CURSORS=1
#export WLR_RENDERER=vulkan

## XDG
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

## fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

## QT
# enables automatic scaling, based on the monitor’s pixel density
export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_STYLE_OVERRIDE=gtk3
export QT_STYLE_OVERRIDE=kvantum
# Tell QT applications to use the Wayland backend, 
# and fall back to x11 if Wayland is unavailable
export QT_QPA_PLATFORM="wayland;xcb"
# Disables window decorations on QT applications
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# Tells QT based applications to pick your theme from qt5ct, use with Kvantum
#QT_QPA_PLATFORMTHEME=qt5ct

## GTK theme
# for gtk3 and gtk4
export GTK_THEME=Arc-Dark
# for gtk2
export GTK2_RC_FILES=/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc


exec Hyprland
