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
## REMOVE ME
export VDPAU_DRIVER=radeonsi
export LIBVA_DRIVER_NAME=radeonsi
export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
export AMD_VULKAN_ICD=RADV

# for steam
export SDL_VIDEODRIVE=wayland

# firefox for wayland
export MOZ_ENABLE_WAYLAND=1

# Force GBM as the wayland backend
#export GBM_BACKEND=nvidia-drm
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

# hyprland
# fix mouse dispear under nvidia
#export WLR_RENDERER=vulkan

## XDG
export XDG_CURRENT_DESKTOP=river
export XDG_SESSION_DESKTOP=river

## fcitx5
## Seems no need anymore
#export GTK_IM_MODULE=fcitx
# need for app like texmacs
#export QT_IM_MODULE=fcitx

export XMODIFIERS=@im=fcitx

## QT
# enables automatic scaling, based on the monitor’s pixel density
export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORM="wayland;xcb"
# qt5/6ct
export QT_QPA_PLATFORMTHEME="qt5ct"
# Disables window decorations on QT applications
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

#env = LIBVA_DRIVER_NAME,nvidia
export XDG_SESSION_TYPE=wayland
#env = GBM_BACKEND,nvidia-drm
#env = __GLX_VENDOR_LIBRARY_NAME,nvidia
#export WLR_NO_HARDWARE_CURSORS=1

river
