#########################################
# "zsh_init
# Author: Rui Pinheiro
#
# Initializes and configures zsh


###################
# Load all files in the correct order

# Environment
dotfiles_source "zsh_env.zsh"

# Zsh script utility functions
dotfiles_source "zsh_script_utils.zsh"

# Zsh configuration
dotfiles_source "zsh_config.zsh"

# Zplug
dotfiles_source "zsh_zplug.zsh"

# Main configuration
dotfiles_source "zsh_main.zsh"

# Aliases
dotfiles_source "zsh_alias.zsh"

# Key bindings
dotfiles_source "zsh_keys.zsh"

# Helper functions
dotfiles_source "zsh_func.zsh"

# Prompt
dotfiles_source "zsh_prompt.zsh"
