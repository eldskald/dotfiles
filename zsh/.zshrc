export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eldskald"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"

# For jump to work
eval "$(jump shell)"

alias nvr="nvim --server ~/.cache/nvim/server --remote-silent"
alias nvserver="nvim --listen ~/.cache/nvim/server"

