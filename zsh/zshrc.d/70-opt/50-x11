#########################################
# hostx.zsh
# Author: Rui Pinheiro
#
# Useful methods/helpers for dealing with X11


# Merge ~/.Xresources
function xrdb_merge {
	xrdb -merge ~/.Xresources
}

# Sets DISPLAY environment variable to network gateway (host)
# If passed a command as argument, runs only this command with the host X display
#
# Useful for Virtualbox VMs, since the host OS is the gateway
function gateway_x {

	local gateway
	local display
	gateway=$(ip route show 0.0.0.0/0 | cut -d\  -f3)

	if [[ -z "$gateway" ]]; then
		echo_error "Could not obtain gateway IP address"
		return 1
	fi

	display="$gateway:0.0"
	echo_info "DISPLAY=\"$display\""

	if [[ -z "$@" ]]; then
		export DISPLAY="$display"
		xrdb_merge
	else
		(
			export DISPLAY="$display"
			xrdb_merge
			$@ 2&>1 > /dev/null &
		)
	fi
}
alias gwx="gateway_x"


# Move X primary selection to clipboard
alias xp2c="xsel -p | xsel -b"

# Move X clipboard to primary
alias xc2p="xsel -b | xsel -p"
