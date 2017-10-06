#########################################
# plugins.tmux
# Author: Rui Pinheiro
#
# Tmux Plugins
# Uses tmux plugins manager: https://github.com/tmux-plugins/tpm


#########################
# List of plugins
set -g @tpm_plugins 'tmux-plugins/tpm '
#set -ga @tpm_plugins 'tmux-plugins/tmux-sensible ' # Sensible default config
set -ga @tpm_plugins 'tmux-plugins/tmux-sidebar ' # cwd tree sidebar using prefix-tab and prefix-backspace
set -ga @tpm_plugins 'tmux-plugins/tmux-prefix-highlight ' # highlight on statusbar is prefix is pressed
set -ga @tpm_plugins 'tmux-plugins/tmux-yank ' # Allow copy to system clipboard using prefix + y (or Y for PWD)
set -ga @tpm_plugins 'nhdaly/tmux-better-mouse-mode ' # Better mouse behaviour
set -ga @tpm_plugins 'tmux-plugins/tmux-cpu ' # CPU usage in status bar


###########################
# tmux-yank: Use "Shift-insert" buffer
set -g @yank_selection 'secondary'


###########################
# tmux-better-mouse-mode
# the pane exits copy-mode when scrolling hits the bottom of the scroll-back history.
set -g @scroll-down-exit-copy-mode on
# scrolling the mouse will not select the moused-over pane
set -g @scroll-without-changing-pane on
# scrolling with your mouse over a pane will perform the scroll in that pane
set -g @scroll-in-moused-over-pane on
# number of lines to scroll per mouse wheel scroll event
set -g @scroll-speed-num-lines-per-scroll 6
# tmux will emulate scrolling for "full-screen", alternate buffer programs, such as less, man, or vi
set -g @emulate-scroll-for-no-mouse-alternate-buffer on


###########################
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
