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

# Music
alias radiomerdamalata='mpv http://s.streampunk.cc/merdamalata.ogg'
alias ytm='yt-dlp -x --audio-format opus --audio-quality 0 --embed-thumbnail --embed-metadata'

# Python virtual environments and conda
alias coa='conda activate'
alias cod='conda deactivate'
alias quspin="source ~/.local/python_envs/quspin/bin/activate"
alias scq="cd ~/docs/uni/code/lgt_scq/ && conda activate scq"

# Remote storage via sshfs
alias mount-mauro='sshfs mauro: ~/remote/mauro'
alias mount-marcos='sshfs marcos: ~/remote/marcos'
alias unmount-mauro='fusermount3 -u ~/remote/mauro'
alias unmount-marcos='fusermount3 -u ~/remote/marcos'

# Backup (non ideal way)
# alias backup="rsync -aP --delete * .* --exclude 'video' --exclude '.conda' --exclude '.cache' --exclude '.local/share/Steam' --exclude 'music' --exclude '.local/share/Trash' --exclude 'downloads/torrents/' /run/media/sunny/SunDATA_1/backup/landau/"
# alias backup="rsync -aP --delete --exclude-from=${HOME}/.config/backup-exclude-list ${HOME}/* ${HOME}/.* /run/media/sunny/SunDATA_1/backup/landau/"

backup() {
    DEST="/run/media/sunny/SunDATA_1/backup/landau/"
    EXCLUDE_FILE="${HOME}/.config/backup-exclude-list"

    pushd ~
    rsync -aP --delete --exclude-from=${EXCLUDE_FILE} * .* ${DEST}
    popd
}

# Cast from android device
#   require 'scrcpy'
#   USB debugging necessary
alias android-cast='scrcpy --video-codec=h265 --max-size=1920 --max-fps=60 --no-audio --keyboard=uhid --stay-awake'
