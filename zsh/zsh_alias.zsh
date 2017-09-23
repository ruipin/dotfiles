#########################################
# zsh_alias
# Author: Rui Pinheiro
#
# Defines multiple useful shell aliases and directory hashes

##############
# Vi(m)
alias vi='vim'
alias watch='watch '
alias xemacs='imgemacs'

whence -p nvim > /dev/null && alias vim='nvim' # Use nvim if it can be found in PATH
alias vimdiff='vim -d'

##############
# System tools
alias grep='grep --color'
alias h='history'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ll.='ls -ld .* --color=auto'
alias ls='ls --color'
alias lsof='/usr/sbin/lsof'
alias disk='du * -sh --total'
alias dua='baobab'
alias sed='sed --follow-symlinks'
alias tmux='tmux -u -2' # Enable UTF-8, 256 color mode by default


#############
# Dotfiles
hash -d dotf=$(readlink -f ~zsh/..)
hash -d dotfiles=~dotf

if is_true $ZSH_CREATE_DOTFILE_SUBFOLDER_ALIASES ; then
	for d in ~dotf/*/ ; do
		local basename=$(basename "$d")

		# Only create aliases for folders that are not excluded
		if [[ ${ZSH_EXCLUDE_DOTFILE_ALIASES[(I)$basename]} -eq 0 ]]; then
			hash -d "$basename"=~dotf/$basename
		fi
	done
fi


#############
# Software source code/builds
hash -d src=$HOME/src
hash -d aur=$HOME/aur

############
# User directories
hash -d downloads=$HOME/Downloads
