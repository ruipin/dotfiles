#########################################
# "init
# Author: Rui Pinheiro
#
# Initializes and configures zsh


###################
# Load all files in the correct order

# Environment
source_dotfiles "env.zsh"

# Zsh script utility functions
source_dotfiles "script_utils.zsh"

# Zsh configuration
source_dotfiles "config.zsh"

# Zplug
source_dotfiles "zplug.zsh"

# Main configuration
source_dotfiles "main.zsh"

# Aliases
source_dotfiles "alias.zsh"

# Key bindings
source_dotfiles "keys.zsh"

# Helper functions
source_dotfiles "func.zsh"

# Prompt
source_dotfiles "prompt.zsh"
