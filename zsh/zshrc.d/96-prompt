#########################################
# prompt.zsh
# Author: Rui Pinheiro
#
# Zsh prompt

###########
# Shell options
setopt PROMPT_SUBST
setopt PROMPT_CR


###########
# VCS Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn

zstyle ':vcs_info:*' formats "%b%c%u "
zstyle ':vcs_info:*' actionformats "%b%c%u (%a:%m) "
zstyle ':vcs_info:*' unstagedstr "%{$fg_bold[red]%}!%{${reset_color}%}"
zstyle ':vcs_info:*' stagedstr "%{$fg_bold[red]%}+%{${reset_color}%}"
zstyle ':vcs_info:git:*' patch-format '%7>>%p%<< %n/%a'
zstyle ':vcs_info:git:*' nopatch-format '%b %n/%a'
zstyle ':vcs_info:*' check-for-changes true


############
# Prompt commands
function precmd() {
	# Print error code
	local error_code=$?
	if [ "$error_code" -ne 0 ]; then
		echo -n "\n$fg_bold[red]ERROR CODE: $error_code"
	fi

	# Update window/pane title
	echo -n "\n"
	print -Pn "\e]0;%25<..<%~\a" # Update pane title with current path. NOTE: %3~ means "show at most 3 parent folders"

	# Recalculate prompt messages
	prompt_jobs
	prompt_cmd_exec_time
	prompt_vimode

	# Re-load VCS information
	vcs_info
}

function preexec {
    export cmd_timestamp=$EPOCHSECONDS
}

function prompt_hostname {
	local is_ssh
	is_ssh
	is_ssh=$?
	if [[ "$is_ssh" -ne 0 ]]; then
		echo -n "%{$fg[yellow]%}%m%{$reset_color%}:"
	fi
}

function prompt_cmd_exec_time {
	local stop=$EPOCHSECONDS
	local start=${cmd_timestamp:-$stop}
	integer elapsed=$stop-$start
	if (($elapsed > ${PROMPT_CMD_MAX_EXEC_TIME:=5})); then
		export prompt_cmd_exec_time_msg="$( prompt_human_time $elapsed )"
	else
		export prompt_cmd_exec_time_msg=""
	fi
	unset cmd_timestamp # Reset timestamp
}

function prompt_human_time {
	local tmp=$1
	local days=$(( tmp / 60 / 60 / 24 ))
	local hours=$(( tmp / 60 / 60 % 24 ))
	local minutes=$(( tmp / 60 % 60 ))
	local seconds=$(( tmp % 60 ))
	(( $days > 0 )) && echo -n "${days}d "
	(( $hours > 0 )) && echo -n "${hours}h "
	(( $minutes > 0 )) && echo -n "${minutes}m "
	echo -n "${seconds}s "
}

function prompt_jobs {
	local jobs_arr=()
	local j i
	for a (${(k)jobstates}) {
		j=$jobstates[$a]
		i="${${(@s,:,)j}[2]}"
		jobs_arr+=($a${i//[^+-]/})
	}
	unset j i

	if [[ -n $jobs_arr ]]; then
		export prompt_jobs_msg="[${(j:,:)jobs_arr}] "
	else
		export prompt_jobs_msg=""
	fi
}

function prompt_vimode {
	export prompt_vimode_msg="${${KEYMAP/vicmd/${PROMPT_VIMODE_INDICATOR}}/(main|viins)/}"
}

function zle-keymap-select {
	prompt_vimode
	zle reset-prompt
}
zle -N zle-keymap-select

#######
# Actually setup prompt variables
setopt promptsubst
PROMPT="$(prompt_hostname)%{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
RPROMPT="\${prompt_vimode_msg}%{$fg_bold[gray]%}\${vcs_info_msg_0_}%{$reset_color%}%{%F{13}%}\${prompt_cmd_exec_time_msg}\${prompt_jobs_msg}%T %{${reset_color}%}"

