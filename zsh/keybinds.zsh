#!/bin/zsh

# Fix home, end, delete and ctrl+delete keys
bindkey '^[[F' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' kill-word

# Make ctrl+left and ctrl+right move between words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Make ctrl+home and ctrl+end also move to beginning/end of line
bindkey '^[[1;5H' beginning-of-line
bindkey '^[[1;5F' end-of-line

# Make up/down to search with what is typed
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Edit command lines on neovim with ctrl+e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

bindkey -v
export KEYTIMEOUT=1
