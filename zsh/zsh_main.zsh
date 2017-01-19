#########################################
# Author: Rui Pinheiro
#
# Loads scripts/aliases/improvements

###################

hash -d dotfiles=$HOME/dotfiles
hash -d zsh=~dotfiles/zsh

# Aliases
source ~zsh/zsh_alias.zsh

# Helper functions
source ~zsh/zsh_func.zsh

# Prompt
source ~zsh/zsh_prompt.zsh
