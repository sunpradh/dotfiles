#
# ALIASES
#

# Require confirmation
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# human readable output
alias df='df -h'     # Human-readable sizes
alias free='free -h' # Show sizes in MB

# colors
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="exa --group-directories-first"
alias ll="exa --group-directories-first -l"
alias la="exa --group-directories-first -la"

# short hands
alias v="nvim"
alias c="config"
alias vw="vimwiki"
alias open="xdg-open"
alias mpvsel='mpv "`xsel -b`"'
alias icat="kitty +kitten icat"
alias fan="watch -n 1 cat /proc/acpi/ibm/fan"
alias ssh="TERM=xterm ssh"
alias dU="du -h --max-depth=1 | sort -h"

# Radio merda malata
alias radiomerdamalata='mpv http://s.streampunk.cc/merdamalata.ogg'

# Conda
alias coa='conda activate'
alias cod='conda deactivate'

# Remote file systems
alias mount-lnxbo="sshfs lnxbo: ~/Remoto/lnxbo/"
alias mount-theophys01="sshfs theophys01: ~/Remoto/theophys01/"
alias mount-theophys02="sshfs theophys02: ~/Remoto/theophys02/"
alias unmount-lnxbo="fusermount -u ~/Remoto/lnxbo/"
alias unmount-theophys01="fusermount -u ~/Remoto/theophys01/"
alias unmount-theophys02="fusermount -u ~/Remoto/theophys02/"
