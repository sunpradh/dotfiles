#==============================
# ZSH ALIASES
#==============================

## Alias section 
# Require confirmation
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"    

# human readable
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias grep="grep --color" 

# short hands
alias pm=pacman
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias vim="nvim"
alias mpv-sel='mpv "`xsel -b`"'
alias icat="kitty +kitten icat"
alias fan="watch -n 1 cat /proc/acpi/ibm/fan"
alias ssh="TERM=xterm ssh"

# Radio merda malata
alias radiomerdamalata='mpv http://s.streampunk.cc/merdamalata.ogg'

# Conda
alias coa='conda activate'
alias cod='conda deactivate'

# Remote file systems
alias mount-lnxbo="sshfs lnxbo: ~/Remoto/lnxbo/"
alias mount-theophys="sshfs theophys: ~/Remoto/theophys/"
alias unmount-lnxbo="fusermount -u ~/Remoto/lnxbo/"
alias unmount-theophys="fusermount -u ~/Remoto/theophys/"
