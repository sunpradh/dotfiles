#
# CUSTOM FUNCTIONS
#

# edit configuration files in .config and custom scripts
config() {
    pushd ~/dotfiles
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

# quickly open vimwiki
VIMWIKIDIR="$HOME/Università/Note/"
vimwiki() {
    pushd $VIMWIKIDIR
    nvim +VimwikiIndex
    popd
}

# convert markdown to pdf with pandoc
md2pdf() {
    filename=${1%.md}
    pandoc ${filename}.md -o ${filename}.pdf && \
        xdg-open ${filename}.pdf
}
