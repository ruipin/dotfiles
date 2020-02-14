#########################################
# input.tmux
# Author: Rui Pinheiro
#
# Tmux key binding definitions


################################
# Misc

# Enable vi keys
set -g @shell_mode 'vi'
set -g status-keys vi
set -g mode-keys vi

# Kill emacs bindings
unbind -T copy-mode -a

# Dont wait for escape keybinds
set-option -sg escape-time 0

# Enable xterm-keys mode for xterm compatibility
setw -g xterm-keys on


################################
# Key bindings

# Reload config file
bind r source-file ~/.tmux.conf

# Re-map prefix
set -g prefix M-Space

# Unbind unwanted keys
unbind '"'
unbind %

# Paste
bind p paste-buffer

# Split Panes
bind j split-window -v    -c '#{pane_current_path}'
bind k split-window -v -b -c '#{pane_current_path}'
bind l split-window -h    -c '#{pane_current_path}'
bind h split-window -h -b -c '#{pane_current_path}'

bind Down  split-window -v    -c '#{pane_current_path}'
bind Up    split-window -v -b -c '#{pane_current_path}'
bind Right split-window -h    -c '#{pane_current_path}'
bind Left  split-window -h -b -c '#{pane_current_path}'

# Move Window
bind -n M-q swap-window -d -t -1
bind -n M-e swap-window -d -t +1
bind -n M-é swap-window -d -t +1

# Resize
bind -n M-o resize-pane -R 2
bind -n M-ó resize-pane -R 2
bind -n M-y resize-pane -L 2
bind -n M-u resize-pane -D 2
bind -n M-ú resize-pane -D 2
bind -n M-i resize-pane -U 2
bind -n M-í resize-pane -U 2

# Switch Panes
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

bind -n M-Left  select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up    select-pane -U
bind -n M-Down  select-pane -D

# Switch Windows
bind -n M-a previous-window
bind -n M-á previous-window
bind -n M-d next-window

# Open/Close Windows/Sessions/Server
bind -n M-w new-window -c '#{pane_current_path}'
bind -n M-s confirm kill-window
bind DC confirm kill-server # Delete
bind Escape confirm kill-session

# Restart Current Pane
bind -n M-r confirm-before -p "respawn-pane -k #P? (y/n)" "respawn-pane -k"

# Select Window By Number (Alt+Number)
bind -n M-1 select-window -t :1
bind -n M-2 select-window -t :2
bind -n M-3 select-window -t :3
bind -n M-4 select-window -t :4
bind -n M-5 select-window -t :5
bind -n M-6 select-window -t :6
bind -n M-7 select-window -t :7
bind -n M-8 select-window -t :8
bind -n M-9 select-window -t :9
bind -n M-0 select-window -t :0

# Page-up/down without prefix
bind -n PPage if -Ft= '#{alternate_on}' "send-keys PPage" "copy-mode\; send-keys PPage"
bind -n NPage if -Ft= '#{alternate_on}' "send-keys NPage" "copy-mode\; send-keys NPage"

# Page-up/down in copy-mode
bind -T copy-mode-vi PPage send-keys -X       stop-selection  \;\
                           send-keys -X       top-line        \;\
                           send-keys -X -N 16 cursor-up

bind -T copy-mode-vi NPage send-keys -X       stop-selection  \;\
                           send-keys -X       bottom-line     \;\
                           send-keys -X -N 16 cursor-down

# Find non-breaking spaces (useful if the prompt contains a NBSP)
bind -T copy-mode-vi Home send-keys -X start-of-line            \;\
                          send-keys -X search-backward "\u00A0" \;\
                          send-keys -X select-line              \;\
                          send-keys -X stop-selection

bind -T copy-mode-vi End  send-keys -X end-of-line              \;\
                          send-keys -X search-forward  "\u00A0" \;\
                          send-keys -X select-line              \;\
                          send-keys -X stop-selection

bind -n Home copy-mode \; send-keys Home
bind -n End  copy-mode \; send-keys End

bind -T copy-mode-vi '~' send-keys Home
bind -T copy-mode-vi '#' send-keys End
bind '~' copy-mode \; send-keys Home
bind '#' copy-mode \; send-keys End

# copy-mode copy behaviour
bind -T copy-mode-vi y send-keys -X copy-pipe "xclip -selection primary" \;\
                       send-keys -X clear-selection

# v starts selection in copy-mode
bind -T copy-mode-vi   v if -Ft= '#{rectangle_toggle}' 'send-keys -X rectangle-toggle' \;\
                         send-keys -X begin-selection

bind -T copy-mode-vi   V if -Ft= '#{rectangle_toggle}' 'send-keys -X rectangle-toggle' \;\
                         send-keys -X select-line

bind -T copy-mode-vi C-v if -Ft= '#{?rectangle_toggle,0,1}' 'send-keys -X rectangle-toggle' \;\
                         send-keys -X begin-selection

##############################
# Mouse

set -g mouse on

# Mouse press selects pane and (in copy mode) cancels selection
bind -T copy-mode-vi MouseDown1Pane select-pane \;\
                                    send-keys -X clear-selection
bind -T copy-mode-vi MouseDown2Pane send-keys MouseDown1Pane
bind -T copy-mode-vi MouseDown3Pane send-keys MouseDown1Pane

bind -n MouseDown2Pane select-pane
bind -n MouseDown3Pane select-pane

# Mouse drags enter copy-mode
#bind -n MouseDrag1Pane copy-mode -M \; send-keys -M
bind -n MouseDrag2Pane copy-mode -M \; send-keys -M
bind -n MouseDrag3Pane copy-mode -M \; send-keys -M

# Mouse drag with right/middle buttons inside copy-mode
bind -T copy-mode-vi MouseDrag2Pane select-pane \; send-keys -X begin-selection
bind -T copy-mode-vi MouseDrag3Pane select-pane \; send-keys -X begin-selection

# Right/Middle Mouse drag copies automatically on release
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X stop-selection # override the default left-click binding
bind -T copy-mode-vi MouseDragEnd2Pane send-keys -X stop-selection \; send-keys -X copy-pipe "xclip -selection primary"
bind -T copy-mode-vi MouseDragEnd3Pane send-keys -X stop-selection \; send-keys -X copy-pipe "xclip -selection clipboard"
