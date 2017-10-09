#########################################
# hostx.zsh
# Author: Rui Pinheiro


# Sets DISPLAY environment variable to network gateway (host)
# If passed a command as argument, runs only this command with the host X display
#
# Useful for Virtualbox VMs, since the host OS is the gateway
function hostx {
	local gateway
	local display
	gateway=$(ip route show 0.0.0.0/0 | cut -d\  -f3)
	display="$gateway:0.0"
	echo_info "DISPLAY=\"$display\""

	if [[ -z "$@" ]]; then
		export DISPLAY="$display"
	else
		DISPLAY="$display" $@ &
	fi
}
