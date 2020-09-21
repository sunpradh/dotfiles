stty -ixon # Disable ctrl-s and ctrl-q

#
## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
#setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=5000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
DIRSTACKSIZE=10


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action


# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors
# Load dir-colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
# Right prompt with exit status of previous command if not successful
RPROMPT="%{$fg[red]%} %(?..[%?])" 
# Right prompt with exit status of previous command marked with ✓ or ✗
 #RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m' # start bold text
export LESS_TERMCAP_md=$'\E[01;32m' # start blinking text (actually make it bold)
export LESS_TERMCAP_me=$'\E[0m'	    # stop bold text
export LESS_TERMCAP_so=$'\E[01;07m' # stop standout text
export LESS_TERMCAP_se=$'\E[0m'	    # start standout (reverse video) text
export LESS_TERMCAP_ue=$'\E[0m'	    # start underlined text
export LESS_TERMCAP_us=$'\E[01;36m' # stop underlined text
export LESS=-r

## Alias section 
# Require confirmation
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"    
alias df='df -h'     # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias grep="grep --color" 

alias pa=pacaur
alias pm=pacman
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias vim="nvim"
alias mpv-sel='mpv "`xsel -b`"'
alias icat="kitty +kitten icat"
alias fan="watch -n 1 cat /proc/acpi/ibm/fan"

# todo file list
#todofile="~/.local/share/todolist"
#alias todo="nvim $todofile"

# set keymap on sway
alias sway-layout="swaymsg input type:keyboard xkb_layout"

# Radio merda malata
alias radiomerdamalata='mpv http://s.streampunk.cc/merdamalata.ogg'

# edit configuration files in .config
cfg() { 
    cd ~/.config
    f="$(fd -H -tf | fzf --preview='highlight --force -O ansi -- {}')"
    [ ! -z $f ] && nvim $f
    cd - }
bin() { 
    cd ~/.local/bin
    f="$(fd -H -tf | fzf --preview='highlight --force -O ansi -- {}')"
    [ ! -z $f ] && nvim $f
    cd - }

# Search a file given only one 1 argument for filter
f() { f="$(fd -tf $1 | fzf)" && [ ! -z $f ] && echo $f && rifle $f }

# set fzf completion and key bindings
FZF_CTRL_T_COMMAND="command fd -L -tf -td -tl -c never"
FZF_ALT_C_COMMAND="command fd -L -td -c never"
FZF_ALT_C_OPTS='--height=80% --preview="tree -C -L 1 {} --dirsfirst"'
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"

# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
alias coa='conda activate'
alias cod='conda deactivate'

