stty -ixon # Disable ctrl-s and ctrl-q

# Options
source ${ZDOTDIR}/options.zsh

# Autocompletion
source ${ZDOTDIR}/autocompletion.zsh

# History
source ${ZDOTDIR}/history.zsh

# Keybindings
source ${ZDOTDIR}/keys.zsh

# Theming
source ${ZDOTDIR}/theme.zsh

# FZF
source ${ZDOTDIR}/fzf.zsh

# Custom functions
source ${ZDOTDIR}/functions.zsh

# Custom aliases
source ${ZDOTDIR}/alias.zsh

# Foot terminal integration
source ${ZDOTDIR}/foot.zsh

# yazi file manager integration
source ${ZDOTDIR}/yazi.zsh

# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# OpenSSL issue with cryptography
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
