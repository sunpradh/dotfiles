#
# HISTORY
#

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=5000
WORDCHARS=${WORDCHARS//\/[&.;]} # Don't consider certain characters part of the word
DIRSTACKSIZE=10

# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
