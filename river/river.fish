set -g _JAVA_AWT_WM_NONREPARENTING 1
# java application font
#set -g XCURSOR_SIZE 24
# vapau
#set -g VDPAU_TRACE 2
#set -g VDPAU_NVIDIA_DEBUG 3
#set -g VDPAU_TRACE_FILE vdpau.log
#set -g VDPAU_DRIVER nvidia

# nvidia
#set -g LIBVA_DRIVER_NAME nvidia
#set -g XDG_SESSION_TYPE wayland

# intel
# use iHD driver for vaapi
## REMOVE ME
set -g VDPAU_DRIVER radeonsi
set -g LIBVA_DRIVER_NAME radeonsi
set -g MESA_LOADER_DRIVER_OVERRIDE radeonsi

# for steam
set -g SDL_VIDEODRIVE wayland

# firefox for wayland
set -g MOZ_ENABLE_WAYLAND 1

# Force GBM as the wayland backend
#set -g GBM_BACKEND nvidia-drm
#set -g __GLX_VENDOR_LIBRARY_NAME nvidia

# hyprland
# fix mouse dispear under nvidia
#set -g WLR_RENDERER vulkan

## XDG
set -g XDG_CURRENT_DESKTOP river
set -g XDG_SESSION_DESKTOP river

## fcitx5
## Seems no need anymore
#set -g GTK_IM_MODULE fcitx
# need for app like texmacs
#set -g QT_IM_MODULE fcitx

set -g XMODIFIERS @im fcitx

## QT
# enables automatic scaling, based on the monitor’s pixel density
set -g QT_AUTO_SCREEN_SCALE_FACTOR 1
#set -g QT_QPA_PLATFORM "wayland;xcb"
set -g QT_QPA_PLATFORM "wayland;xcb"
# qt5/6ct
set -g QT_QPA_PLATFORMTHEME "qt5ct"
# Disables window decorations on QT applications
set -g QT_WAYLAND_DISABLE_WINDOWDECORATION 1

#env   LIBVA_DRIVER_NAME,nvidia
set -g XDG_SESSION_TYPE wayland
#env   GBM_BACKEND,nvidia-drm
#env   __GLX_VENDOR_LIBRARY_NAME,nvidia
#set -g WLR_NO_HARDWARE_CURSORS 1

river

