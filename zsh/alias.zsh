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

# folders
alias uni="cd ~/docs/uni/"
alias wri="cd ~/docs/uni/writing/"
alias code="cd ~/docs/uni/code/"
alias art="cd ~/docs/uni/articles/"
alias slides="cd ~/docs/uni/slides/"
alias drop="cd ~/remote/Dropbox/"
alias dot="cd ~/docs/dotfiles/"
alias kitaev="cd ~/docs/uni/writing/kitaev\ long-range/"
alias phd="cd ~/docs/phd-thesis/"

# short hands
alias v="nvim"
alias vim="nvim"
alias ra="ranger"
alias c="config"
alias vw="vimwiki"
alias open="rifle"
alias mpvsel='mpv "`xsel -b`"'
alias ssh="TERM=xterm ssh"

# Radio merda malata
alias radiomerdamalata='mpv http://s.streampunk.cc/merdamalata.ogg'

# Conda
alias coa='conda activate'
alias cod='conda deactivate'
alias quspin='conda activate quspin'

# Remote file systems
alias tp1="ssh theophys01"
alias tp2="ssh theophys02"
alias mount-lnxbo="sshfs lnxbo: ~/remote/lnxbo/"
alias mount-tp1="sshfs theophys01: ~/remote/theophys01/"
alias mount-tp2="sshfs theophys02: ~/remote/theophys02/"
alias unmount-lnxbo="fusermount -u ~/remote/lnxbo/"
alias unmount-tp1="fusermount -u ~/remote/theophys01/"
alias unmount-tp2="fusermount -u ~/remote/theophys02/"
alias lazy-unmount-lnxbo="fusermount -zu ~/remote/lnxbo/"
alias lazy-unmount-tp1="fusermount -zu ~/remote/theophys01/"
alias lazy-unmount-tp2="fusermount -zu ~/remote/theophys02/"

alias backup="rsync -aP --delete * .* --exclude '.cache' --exclude '.local/share/Steam' --exclude 'music' --exclude '.local/share/Trash' /run/media/sunny/SunDATA_1/backup/heisenberg/"
