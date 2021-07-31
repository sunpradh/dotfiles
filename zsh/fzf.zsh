#
# FZF (fuzzy finder)
#

export FZF_DEFAULT_COMMAND="fd -L -t f"
export FZF_CTRL_T_COMMAND="command fd -L -tf -td -tl -c never"
export FZF_ALT_C_COMMAND="command fd -L -td -c never"
export FZF_ALT_C_OPTS='--height=80% --preview="tree -C -L 1 {} --dirsfirst"'
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"
