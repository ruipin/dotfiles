#########################################
# toggle_keys.conf
# Author: Rui Pinheiro
#
# Allows to toggle tmux listening to keys with a single key
# Useful for nested tmux sessions (e.g. tmux over ssh inside a tmux session)

bind -T root F12  \
  set prefix None \;\
  set key-table off \;\
  if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
  refresh-client -S \;\

bind -T off F12 \
  set -u prefix \;\
  set -u key-table \;\
  refresh-client -S
