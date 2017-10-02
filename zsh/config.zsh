#########################################
# config.zsh
# Author: Rui Pinheiro
#
# Configuration file for the zsh scripts

########################
# Output

# Whether to output debug information ("echo_debug")
export ZSH_SCRIPT_DEBUG=1

# Title to use in echo_* functions, i.e. "[<script title>] Message here"
export ZSH_SCRIPT_TITLE="SCRIPT"


########################
# Dotfiles

# Create aliases for the folders inside ~dotfiles ?
export ZSH_CREATE_DOTFILE_SUBFOLDER_ALIASES=1

# Folders to exclude from dotfile hash aliases
export ZSH_EXCLUDE_DOTFILE_ALIASES=("applications")


########################
# Zplug
export ZPLUG_ROOT="/usr/share/zsh/scripts/zplug"


########################
# Dircolors
export ZSH_DIRCOLORS_PATH="$HOME/src/dircolors-solarized/dircolors.256dark"


########################
# Locale

# Force UTF-8 locale
export ZSH_FORCE_UTF8=1


########################
# Local Prefix
export LOCAL_PREFIX=""
export LOCAL_BUILD_FOLDER="$HOME/src"


########################
# Tmux
export TMUX_MAIN_SESSION="main"
