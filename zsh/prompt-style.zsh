#!/bin/zsh

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats ' %F{blue}git:(%f%b%F{blue})%f%u%c'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr ' %F{yellow}*%f'
zstyle ':vcs_info:git:*' stagedstr ' %F{green}+%f'
precmd() {
    vcs_info
}

unsetopt PROMPT_SP
setopt PROMPT_SUBST

PROMPT='%F{blue}┌[%f%B%n%F{blue}@%f%m%b%F{blue}]%f${vcs_info_msg_0_} %(?..%F{blue}[%f%F{red}%?%f%F{blue}]%f)
%F{blue}└[%f%B%~%b%F{blue}]>%f '
