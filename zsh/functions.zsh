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
    FILE="$(fd -tf $1 | fzf --reverse --height=80%)"
    # [ ! -z $f ] && nohup xdg-open ${FILE} >/dev/null & disown
    if [ ! -z ${FILE} ]; then
        xdg-open ${FILE} &> /dev/null & disown
    fi
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

# print the contents of a csv file using pandas
csv() {
    python -c "import pandas; print(pandas.read_csv('${1}'))"
}

csvhead() {
    python -c "import pandas
for n, f in enumerate(pandas.read_csv('${1}')): print(f'{n+1:>3}  {f}')"
}

# Microphone loopback (to hear the microphone)
microphone-loop() {
    if [ $1 = "on" ]; then
        echo "Activating microphone loopback"
        pactl load-module module-loopback latency_msec=1
    fi
    if [ $1 = "off" ]; then
        echo "Deactivating microphone loopback"
        pactl unload-module module-loopback
    fi
}

# Convert from all the FLAC files in a directory into OPUS
# optional argument: --remove-after
flac2opus() {
    for file in **/*.flac; do
        ffmpeg -i "${file}" -c:a libopus -b:a 160K "${file%flac}opus"
    done

    if [[ ! -z $1 ]]; then
        if [[ $1 == "--remove-after" ]]; then
            answer='y'
            echo
        elif [[ $1 == '--keep' ]]; then
            answer='n'
            echo
        fi
    else
        echo -e "\n$(tput bold)> Remove .flac files? [N/y]$(tput sgr0)"
        read answer
    fi

    if [[ $answer = "Y" || $answer = "y" ]]; then
        echo "Removing .flac files"
        rm -rfv **/*.flac
    else
        echo "Keeping .flac files"
    fi
    echo -e "\n$(tput bold)Done!$(tput sgr0)"
}
