#########################################
# theme.tmux
# Author: Rui Pinheiro
#
# Tmux theme and related configuration

###############################
# Windows + Panes

# Renumber windows
set -g renumber-windows on
set-option -g automatic-rename on
set-option -g allow-rename on
set -g set-titles on
set -g set-titles-string "#W: #T"

# Disable activity checking
set -g visual-activity off
set -g monitor-activity off
set -g visual-bell off

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# Titles
set -g set-titles on
set -g set-titles-string "tmux (#I:#W)"


################################
# Statusbar
set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour137
set -g status-attr dim
set -g status-left ''
set -g status-right '#{prefix_highlight} #(hostname)#{cpu_fg_color}#{cpu_percentage} #[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-fg colour81
setw -g window-status-current-bg colour238
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F #[fg=colour250]#T '

setw -g window-status-fg colour138
setw -g window-status-bg colour235
setw -g window-status-attr none
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F #T '

setw -g window-status-bell-attr none
setw -g window-status-bell-fg colour138
setw -g window-status-bell-bg colour235

set -g status-interval 5 # refresh 'status-left' and 'status-right' more often
setw -g aggressive-resize on # super useful when using "grouped sessions" and multi-monitor setup
