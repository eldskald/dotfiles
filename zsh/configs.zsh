#!/bin/zsh

export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR='nvim'

source $HOME/dotfiles/zsh/colored-ls.zsh
source $HOME/dotfiles/zsh/prompt-style.zsh
source $HOME/dotfiles/zsh/vi-mode-cursor.zsh
source $HOME/dotfiles/zsh/setup-fzf.zsh

autoload -U compinit; compinit

# Fix home, end, delete and ctrl+delete keys
bindkey '^[[F' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' kill-word

# Make ctrl+left and ctrl+right move between words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Make up to search with what is typed
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Enable vim mode
bindkey -v
export KEYTIMEOUT=1

