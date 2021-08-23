# Some environment variables
export ZDOTDIR="$HOME/.config/zsh"
export TERMCMD=foot
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export QT_QPA_PLATFORMTHEME=qt5ct

# Start graphical environment
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export VDPAU_DRIVER=va_gl
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi

