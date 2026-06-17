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
alias media="cd /run/media/sunny/"
alias wri="cd ~/docs/uni/writing/"
alias code="cd ~/docs/uni/code/"
alias art="cd ~/docs/uni/articles/"
alias slides="cd ~/docs/uni/slides/"
alias drop="cd ~/remote/Dropbox/"

# short hands
alias v="nvim"
alias vim="nvim"
alias c="config"
alias mpvsel='mpv "`xsel -b`"'
alias ssh="TERM=xterm ssh"

# Radio merda malata
alias radiomerdamalata='mpv http://s.streampunk.cc/merdamalata.ogg'

# Python virtual environments and conda
alias coa='conda activate'
alias cod='conda deactivate'
alias quspin-env="source ~/.local/python_envs/quspin/bin/activate"
alias scq-env="conda activate scq"

# Backup (non ideal way)
alias backup="rsync -aP --delete * .* --exclude 'video' --exclude '.conda' --exclude '.cache' --exclude '.local/share/Steam' --exclude 'music' --exclude '.local/share/Trash' --exclude 'downloads/torrents/' /run/media/sunny/SunDATA_1/backup/landau/"

# Cast from android device
#   require 'scrcpy'
#   USB debugging necessary
alias android-cast='scrcpy --video-codec=h265 --max-size=1920 --max-fps=60 --no-audio --keyboard=uhid --stay-awake'
