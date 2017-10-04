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

# Dont wait for escape keybinds
set-option -sg escape-time 0

# Enable xterm-keys mode for xterm compatibility
setw -g xterm-keys on


################################
# Key bindings

# Re-map prefix
set -g prefix M-Space

# Unbind unwanted keys
unbind '"'
unbind %

# Binding: Paste
bind p paste-buffer

# Bindings: Split Panes
bind j split-window -v    -c '#{pane_current_path}'
bind k split-window -v -b -c '#{pane_current_path}'
bind l split-window -h    -c '#{pane_current_path}'
bind h split-window -h -b -c '#{pane_current_path}'

bind Down  split-window -v    -c '#{pane_current_path}'
bind Up    split-window -v -b -c '#{pane_current_path}'
bind Right split-window -h    -c '#{pane_current_path}'
bind Left  split-window -h -b -c '#{pane_current_path}'

# Bindings: Move Window
bind -n M-q swap-window -t -1
bind -n M-e swap-window -t +1
bind -n M-é swap-window -t +1

# Bindings: Resize
bind -n M-o resize-pane -R 2
bind -n M-ó resize-pane -R 2
bind -n M-y resize-pane -L 2
bind -n M-u resize-pane -D 2
bind -n M-ú resize-pane -D 2
bind -n M-i resize-pane -U 2
bind -n M-í resize-pane -U 2

# Binding: Reload config file
bind r source-file ~/.tmux.conf

# Bindings: Switch Panes
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

bind -n M-Left  select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up    select-pane -U
bind -n M-Down  select-pane -D

# Bindings: Switch Windows
bind -n M-a previous-window
bind -n M-á previous-window
bind -n M-d next-window

# Bindings: Open/Close Windows/Sessions/Server
bind -n M-w new-window -c '#{pane_current_path}'
bind -n M-s confirm kill-window
bind DC confirm kill-server # Delete
bind Escape confirm kill-session

# Binding: Restart Current Pane
bind -n M-r confirm-before -p "respawn-pane -k #P? (y/n)" "respawn-pane -k"

# Bindings: Select Window By Number (Alt+Number)
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

# Bindings: Swap Window Position
bind-key -n C-S-Left swap-window -t -1
bind-key -n C-S-Right swap-window -t +1


##############################
# Mouse

# Mouse support (Tmux 2.2+)
set -g mouse on

# Tmux 2.1 or older:
#set -g mouse-utf8 on
#set-option -g mouse-select-pane on
#set-option -g mouse-resize-pane on
#set-option -g mouse-select-window on
