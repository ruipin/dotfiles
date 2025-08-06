#!/usr/bin/env zsh

# We need to patch zplug to run properly without an interactive shell
# Otherwise it believes we are trying to pipe in a command
sed -i -e 's~\[\[ -p /dev/stdin ]]~false~' ~/.zplug/base/core/add.zsh

# Prepare environment
export ZPLUG_ROOT=~/.zplug
export ZSHRC_ZPLUG_INIT_TYPE=3
source ~/dotfiles/zsh/zshrc.d/10-env/00-script_utils

# Call up zplug
source ~/dotfiles/zsh/zshrc.d/70-zplug > ~/.zplug/ansible.log
[[ "$?" -ne "0" ]] && exit1

# Parse output to decide whether something changed
grep -q 'Installed' ~/.zplug/ansible.log && echo "Installed"

# Done
exit 0