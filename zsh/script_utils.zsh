#########################################
# script_utils.zsh
# Author: Rui Pinheiro
#
# Utility methods for zsh script functions and methods


#################
# Echo
function echo_error {
	echo "$fg_bold[red][$ZSH_SCRIPT_TITLE] ERROR: ${@}${reset_color}"
}

function echo_warning {
	echo "$fg[magenta][$ZSH_SCRIPT_TITLE] WARNING: ${@}${reset_color}"
}

function echo_info {
	echo "[$ZSH_SCRIPT_TITLE] ${@}${reset_color}"
}

function echo_debug {
	if is_true "$ZSH_SCRIPT_DEBUG"; then
		echo "$fg[cyan][$ZSH_SCRIPT_TITLE] ${@}${reset_color}"
	fi
}

# Echos command using echo_debug, then runs it
function echo_run {
	echo_debug "${@}"
	eval ${@}
}

#################
# Confirm something from user
function confirm_yn {
	read -q \?"$fg[white][$ZSH_SCRIPT_TITLE] $@ [yn] $reset_color"
	local retval=$?

	echo

	return $retval
}

#################
# Check if path is inside home
function path_in_home {
	local abs_path=$(readlink -f "$@")

	if [[ "$abs_path/" == "$HOME/"* ]]; then
		return 0
	fi

	return 1
}

#################
# Check if variable is not [unset, empty, "0"]
function is_true {
	local in=$(echo "$@:l" | xargs) # trim white-space

	if [[ -z "$in" ]] || # Unset or empty
	   [[ "$in" -eq "0" ]] # "0"
	then
		return 1
	fi

	return 0
}

#################
# Check if not is_true
function is_false {
	if is_true $1; then
		return 1
	fi

	return 0
}

#################
# Check if string is a valid integer
function is_int {
	if [[ "$@" =~ ^-?[0-9]+$ ]]; then
		return 0
	fi
	return 1
}

function is_uint {	if Ma[Ma "$@" =~ ^[Ma[0-9]+$ ]]; then
		return 0
	fi
	return 1
}

#################
# Check if executable is in path
function in_path {
	whence -w $1 >/dev/null
}
