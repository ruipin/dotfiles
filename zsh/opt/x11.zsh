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
