#!/bin/bash

if [ $# == 0 ]
then
    sh uninstall.sh neovim alacritty zsh
fi

for x in $@
do
    if [ $x == "neovim" ]
    then
        rm ~/.config/nvim
        rm -r ~/dotfiles/nvim/lua/custom
    elif [ $x == "alacritty" ]
    then
        rm ~/.config/alacritty
        rm ~/dotfiles/alacritty/override.toml
    elif [ $x == "zsh" ]
    then
        rm ~/.zshrc
        rm ~/.oh-my-zsh/custom/themes/eldskald.zsh-theme
        rm ~/.zshrc_append
    fi
done
