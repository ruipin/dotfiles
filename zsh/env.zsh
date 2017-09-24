#########################################
# env.zsh
# Author: Rui Pinheiro
#
# Set of methods, functions and tweaks that set up the system/development/build environment

#########################
# Safely prepend to ":"-separated array
# Usage: env_prepend <name> <string_to_prepend>
function env_prepend {
	local prepend_str="${@:2}"

	# Remove duplicates
	env_remove "$1" "$prepend_str"

	# Prepend to variable
	local new_val=""
	local old_val="${(P)1}"
	if [[ ! -z "$old_val" ]]; then
		new_val=":${old_val}"
	fi
	new_val="${prepend_str}${new_val}"

	# Save result
	export "$1"="$new_val"
}

# Safely append to ":"-separated array
# Usage: env_append <name> <string_to_prepend>
function env_append {
	local append_str="${@:2}"

	# Remove duplicates
	env_remove "$1" "$append_str"

	# Prepend to variable
	local new_val=""
	local old_val="${(P)1}"
	if [[ ! -z "$old_val" ]]; then
		new_val="${old_val}:"
	fi
	new_val="${new_val}${append_str}"

	# Save result
	export "$1"="$new_val"
}

# Safely remove from ":"-separated array
# Accepts a perl regex
# IMPORTANT: '#' is used as separator, so is not allowed)
# IMPORTANT: Make sure not to match ":"! For example, use non-greedy ".*?"
function env_remove {
	local new_val="${(P)1}"
	local search_str="${@:2}"

	# Remove any occurrence
	new_val=$( \
		echo "$new_val" |                    \
		\perl -p -e "s#:${search_str}:#:#g;" \
		         -e "s#:${search_str}\$##g;" \
		         -e "s#^${search_str}:##g;"  \
		         -e "s#^${search_str}\$##g;" \
	)

	export "$1"="$new_val"
}
