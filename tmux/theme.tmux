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
set -g set-titles-string "#S (#I:#W)"


################################
# Statusbar
set -g status-position bottom
set -g status-style fg=colour137,bg=colour234,dim
set -g status-left ''
set -g status-right '#[fg=colour231,bg=colour04]#(tmux show-option -qv key-table)#{prefix_highlight} #(hostname) #S #{cpu_fg_color}#{cpu_percentage} #[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
set -g status-right-length 60
set -g status-left-length 20

setw -g window-status-current-style fg=colour81,bg=colour238,bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F #[fg=colour250]#T '

setw -g window-status-style fg=colour138,bg=colour235
setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F #T '

setw -g window-status-bell-style fg=colour138,bg=colour235

set -g status-interval 5 # refresh 'status-left' and 'status-right' more often
setw -g aggressive-resize on # super useful when using "grouped sessions" and multi-monitor setup
