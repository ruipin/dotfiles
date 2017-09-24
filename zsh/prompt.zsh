#########################################
# zsh_prompt
# Author: Rui Pinheiro
#
# Zsh prompt

autoload -U colors && colors

setopt PROMPT_SUBST
setopt PROMPT_CR

function precmd() {
	local error_code=$?
	if [ "$error_code" -ne 0 ]; then
		echo -n "\n$fg_bold[red]ERROR CODE: $error_code"
		export $?="0"
	fi

	echo -n "\n"
	print -Pn "\e]0;%25<..<%~\a" # Update pane title with current path. NOTE: %3~ means "show at most 3 parent folders"
}

#PROMPT=$'%{\e[7l\e[2K\e[2K\e[1A\n\e[7h%}%{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# '
PROMPT="%{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
RPROMPT="%{%F{13}%}%T %{%f%k%}"

