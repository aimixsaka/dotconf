#!/usr/bin/env fish
set -gx _JAVA_AWT_WM_NONREPARENTING 1
# java application font
set -gx XCURSOR_SIZE 32
# vapau
#set -gx VDPAU_TRACE 2
#set -gx VDPAU_NVIDIA_DEBUG 3
#set -gx VDPAU_TRACE_FILE vdpau.log
#set -gx VDPAU_DRIVER nvidia

# nvidia
#set -gx LIBVA_DRIVER_NAME nvidia
#set -gx XDG_SESSION_TYPE wayland

# intel
# use iHD driver for vaapi

# for mpv
#set -gx AMD_VULKAN_VCD RADV


# for steam
set -gx SDL_VIDEODRIVE wayland

# firefox for wayland
set -gx MOZ_ENABLE_WAYLAND 1

# Force GBM as the wayland backend
#set -gx GBM_BACKEND nvidia-drm
#set -gx __GLX_VENDOR_LIBRARY_NAME nvidia

# hyprland
# fix mouse dispear under nvidia
#set -gx WLR_RENDERER vulkan

## XDG
set -gx XDG_CURRENT_DESKTOP river
set -gx XDG_SESSION_DESKTOP river

## fcitx5
## Seems no need anymore
#set -gx GTK_IM_MODULE fcitx
# need for app like texmacs
#set -gx QT_IM_MODULE fcitx

set -gx XMODIFIERS @im=fcitx

## QT
# enables automatic scaling, based on the monitor’s pixel density
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
#set -gx QT_QPA_PLATFORM "wayland;xcb"
set -gx QT_QPA_PLATFORM "wayland;xcb"
# qt5/6ct
set -gx QT_QPA_PLATFORMTHEME "qt5ct"
# Disables window decorations on QT applications
set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1

#env   LIBVA_DRIVER_NAME,nvidia
set -gx XDG_SESSION_TYPE wayland
#env   GBM_BACKEND,nvidia-drm
#env   __GLX_VENDOR_LIBRARY_NAME,nvidia
#set -gx WLR_NO_HARDWARE_CURSORS 1

#~/workspace/wayland/river/zig-out/bin/river
river

