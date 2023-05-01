#
# CUSTOM FUNCTIONS
#

# edit configuration files in .config and custom scripts
config() {
    pushd ~/docs/dotfiles
        f="$(fd -HL -tf | fzf --preview='highlight --force -O ansi -- {}')"
    [ ! -z $f ] && $EDITOR $f
    popd
}

# Quickly open a file using fzf and ranger's rifle
quickopen() {
    f="$(fd -tf $1 | fzf --reverse --height=80%)"
    [ ! -z $f ] && rifle $f
    zle reset-prompt
}
zle -N quickopen
bindkey '^O' quickopen

# convert markdown to pdf with pandoc
md2pdf() {
    filename=${1%.md}
    pandoc ${filename}.md -o ${filename}.pdf && \
        xdg-open ${filename}.pdf
}

# download videos with youtube-dl and aria2
ytdl() {
    # youtube-dl "$1" --format "(mp4)[height=1080][fps<=60]" --external-downloader aria2c --external-downloader-args "-j 8 -s 8 -x 8 -k 5M"
    youtube-dl "$1" --external-downloader aria2c --external-downloader-args "-j 8 -s 8 -x 8 -k 5M"
}

ytdl-paste() {
    ytdl $(wl-paste)
}

# print the contents of a csv file using pandas
csv() {
    python -c "import pandas; print(pandas.read_csv('${1}'))"
}

csvhead() {
    python -c "import pandas
for n, f in enumerate(pandas.read_csv('${1}')): print(f'{n+1:>3}  {f}')"
}
