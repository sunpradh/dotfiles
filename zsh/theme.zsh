#
# THEMING
#

autoload -U compinit colors zcalc
compinit -d ~/.cache/zsh/zcompdump
colors
# Load dir-colors
#test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

## Plugins section: Enable fish style features
# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable substitution for prompt
setopt prompt_subst

# Prompt
PROMPT="%{$fg[black]$bg[blue]%} %(4~|%-1~/.../%2~|%~)%u %B%(?.%{$bg[blue]%}.%{$bg[red]%}) $ %{$reset_color%}%b "

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m' # start bold text
export LESS_TERMCAP_md=$'\E[01;32m' # start blinking text (actually make it bold)
export LESS_TERMCAP_me=$'\E[0m'	    # stop bold text
export LESS_TERMCAP_so=$'\E[01;07m' # stop standout text
export LESS_TERMCAP_se=$'\E[0m'	    # start standout (reverse video) text
export LESS_TERMCAP_ue=$'\E[0m'	    # start underlined text
export LESS_TERMCAP_us=$'\E[01;36m' # stop underlined text
export LESS=-r
