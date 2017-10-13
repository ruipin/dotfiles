#########################################
# keys.zsh 
# Author: Rui Pinheiro
#
# Zsh key bindings

bindkey -v
bindkey "^[[7~" beginning-of-line
bindkey "^A"    beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^E"    end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[2~" overwrite-mode
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history
bindkey -M      vicmd 'k' history-substring-search-up
bindkey -M      vicmd 'j' history-substring-search-down
bindkey -v      '^?'  backward-delete-char

bindkey '^[[A'  history-substring-search-up
bindkey '^[[B'  history-substring-search-down

bindkey "^i"    complete-word # Tab
bindkey "^[[Z"  expand-word   # Shift-Tab

#bindkey '^ ' autosuggest-accept


# Avoid waiting for escape timeouts
export KEYTIMEOUT=1
