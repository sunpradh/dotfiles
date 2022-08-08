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

# autostart swaywm
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export TERMCMD=foot
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi

# vim: ft=zsh
