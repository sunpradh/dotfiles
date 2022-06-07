# extends $PATH
if [[ ! $PATH =~ $HOME ]]; then
    export PATH=${PATH}:${HOME}/.local/bin
fi

# check if cache dir exists
ZCACHEDIR="$HOME/.cache/zsh"
test -d $ZCACHEDIR || mkdir -p $ZCACHEDIR

# Some environment variables
export ZDOTDIR="$HOME/.config/zsh"
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export QT_QPA_PLATFORMTHEME=gtk2
export GTK2_RC_FILES="~/.config/gtk-2.0/gtkrc-2.0"
export RANGER_DEVICONS_SEPARATOR='  '
export VDPAU_DRIVER=va_gl

# Wayland specific
# export MOZ_ENABLE_WAYLAND=1
# export VDPAU_DRIVER=va_gl
# export XDG_SESSION_TYPE=wayland
# export XDG_CURRENT_DESKTOP=sway


# autostart swaywm
if [[ -z $DISPLAY ]]; then
    if [[ $(tty) = /dev/tty1 ]]; then
        export MOZ_ENABLE_WAYLAND=1
        export TERMCMD=foot
        export XDG_SESSION_TYPE=wayland
        export XDG_CURRENT_DESKTOP=sway
        exec sway
    elif [[ $(tty) = /dev/tty2 ]]; then
        export MOZ_ENABLE_WAYLAND=0
        export TERMCMD=alacritty
        export XDG_SESSION_TYPE=x11
        startx
    fi
fi


# vim: ft=zsh
