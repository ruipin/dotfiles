#########################################
# zsh_zplug
# Author: Rui Pinheiro
#
# Initializes and load Zplug and corresponding plugins


###############
# Initialize Zplug
export ZPLUG_HOME="$HOME/.zplug"
source "$ZPLUG_ROOT/init.zsh"

###############
# Plugins
zplug "zplug/zplug"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-autosuggestions"
#zplug "rupa/z", use:z.sh # Disabled as it slows down Zsh quite a bit

###############
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

###############
# Finalize plugin loading
zplug load #--verbose
