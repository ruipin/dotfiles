#########################################
# misc.zsh
# Author: Rui Pinheiro
#
# Miscellaneous zsh configuration

#################################
# Misc configuration

# Disable ctrl+S
stty -ixon

# Autoload zsh command completion
fpath=(~zsh/completion $fpath)
autoload -U compinit

# Cd to directory if command is a directory
setopt autocd

# Do not close bg processes when leaving
#unsetopt hup

# Make cd behave like pushd
setopt pushdtohome autopushd

# Do not allow terminal to be frozen with ^s/^q
unsetopt flowcontrol

# For ambiguous completion, show completion menu on succesive tab press
setopt auto_menu

# For ambiguous completion, only start menu-completion after pressing tab again
unsetopt menu_complete

# Show list of ambiguous matches immediately, without needing to press tab again
unsetopt list_ambiguous

# Complete at cursor position (ie: "M[CURSOR]file" to "Makefile")
setopt complete_in_word

# Show list of completions per row, instead of per column
setopt list_rows_first

# Try to make the completion lists as small as possible
setopt list_packed

# Cursor is moved to end of word after completion
setopt always_to_end

# Enable extended glob, e.g. "rm ^*sysc" to match all files that dont end in "sysc"
setopt extendedglob

# LS_COLORS
eval `dircolors $ZSH_DIRCOLORS_PATH`


####################
# Completion style
zstyle ':completion:*' completer _complete _match _approximate:-one #_approximate:-two
zstyle ':completion:*:approximate-one:*' max-errors 1
zstyle ':completion:*:approximate-two:*' max-errors 2

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true #completion for cd ..
zstyle ':completion:*:sudo::' environ PATH="$PATH:/sbin:/usr/sbin" #Update autocompletion path for sudo
# Completion for cd ..
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
compinit


####################
# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

###################
# Defaults
export EDITOR="vim"
export PAGER="less"
export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"

###################
# Auto-suggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20


###################
# Ruby
if in_path "rbenv" && [[ -d "$HOME/.gem" ]]; then
	eval "$(rbenv init -)"
	env_append PATH "$HOME/.gem/ruby/2.4.0/bin"
fi
