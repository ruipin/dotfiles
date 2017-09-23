#########################################
# zsh_init
# Author: Rui Pinheiro
#
# Initializes and configures zsh

###################

# Disable ctrl+S
stty -ixon


###################
# Load all files in the correct order
hash -d zsh="${0:h}"

# Environment
source ~zsh/zsh_env.zsh

# Zsh script utility functions
source ~zsh/zsh_script_utils.zsh

# Zsh configuration
source ~zsh/zsh_config.zsh

# Zplug
source ~zsh/zsh_zplug.zsh

# Main configuration
source ~zsh/zsh_main.zsh

# Aliases
source ~zsh/zsh_alias.zsh

# Key bindings
source ~zsh/zsh_keys.zsh

# Helper functions
source ~zsh/zsh_func.zsh

# Prompt
source ~zsh/zsh_prompt.zsh
