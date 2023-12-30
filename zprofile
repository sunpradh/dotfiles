# Extends $PATH
if [[ ! $PATH =~ $HOME ]]; then
    export PATH=${PATH}:${HOME}/.local/bin
fi

# Dotfiles
export ZDOTDIR="$HOME/.config/zsh"
export GTK2_RC_FILES="~/.config/gtk-2.0/gtkrc-2.0"

# Check if cache dir exists for zsh
ZCACHEDIR="$HOME/.cache/zsh"
test -d $ZCACHEDIR || mkdir -p $ZCACHEDIR

# Some environment variables
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox

# Hardware acceleration
export VDPAU_DRIVER=va_gl

# Qt theme
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_STYLE_OVERRIDE=kvantum

# Ranger file manager visual fix
export RANGER_DEVICONS_SEPARATOR='  '

#
# Autostart swaywm
#
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    # Enable QT applications to use Wayland, allow also X11 as a fallback
    export QT_QPA_PLATFORM="wayland"
    # Enable Wayland on Firefox
    export MOZ_ENABLE_WAYLAND=1
    export TERMCMD=foot
    # Force the detection of Wayland (just to be sure)
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    # Start sway
    exec sway
fi

# vim: ft=zsh
