function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}

add-zsh-hook -Uz chpwd chpwd-osc7-pwd


precmd() {
    print -Pn "\e]133;A\e\\"
    if ! builtin zle; then
        print -n "\e]133;D\e\\"
    fi
}

function preexec {
    print -n "\e]133;C\e\\"
}

# Set terminal window and tab/icon title
#
# usage: title short_tab_title [long_window_title]
#
# See: http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
# Fully supports screen, iterm, and probably most modern xterm and rxvt
# (In screen, only short_tab_title is used)
# Limited support for Apple Terminal (Terminal can't set window and tab separately)
function title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  case "$TERM" in
      xterm*|putty*|rxvt*|ansi|foot*)
          print -Pn "\e]2;$2:q\a" # set window name
          print -Pn "\e]1;$1:q\a" # set tab name
          ;;
      screen*)
          print -Pn "\ek$1:q\e\\" # set screen hardstatus
          ;;
      *)
          # Try to use terminfo to set the title
          # If the feature is available set title
          if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
              echoti tsl
              print -Pn "$1"
              echoti fsl
          fi
      ;;
esac
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="zsh: %~"

# Runs before showing the prompt
function omz_termsupport_precmd {
  emulate -L zsh

  if [[ "$DISABLE_AUTO_TITLE" == true ]]; then
    return
  fi

  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}


# Runs before executing the command
function omz_termsupport_preexec {
  emulate -L zsh
  setopt extended_glob

  if [[ "$DISABLE_AUTO_TITLE" == true ]]; then
    return
  fi

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title 'zsh: $CMD' 'zsh: %100>...>$LINE%<<'
}

precmd_functions+=(omz_termsupport_precmd)
preexec_functions+=(omz_termsupport_preexec)


