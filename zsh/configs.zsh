#!/bin/zsh

export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR='nvim'

source $HOME/dotfiles/zsh/setup-autocompletion.zsh
source $HOME/dotfiles/zsh/prompt-style.zsh
source $HOME/dotfiles/zsh/colored-ls.zsh
source $HOME/dotfiles/zsh/keybinds.zsh
source $HOME/dotfiles/zsh/vi-mode-cursor.zsh
source $HOME/dotfiles/zsh/setup-fzf.zsh

