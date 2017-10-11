#########################################
# ssh.zsh
# Author: Rui Pinheiro
#
# SSH-related functionality


# Returns non-zero if this is an ssh session
function is_ssh {
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
		return 1
	else
		case $(ps -o comm= -p $PPID) in
			sshd|*/sshd) return 1
		esac
	fi
	return 0
}
