#!/bin/bash

if [ $# == 0 ]
then
    sh install.sh neovim alacritty zsh
fi

for x in $@
do
    if [ $x == "neovim" ]
    then
        ln -s ~/dotfiles/nvim/ ~/.config/nvim
    elif [ $x == "alacritty" ]
    then
        ln -s ~/dotfiles/alacritty/ ~/.config/alacritty/
        cp override.toml.example ./alacritty/override.toml
    elif [ $x == "zsh" ]
    then
        ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
        ln -s ~/dotfiles/zsh/eldskald.zsh-theme ~/.oh-my-zsh/custom/themes/eldskald.zsh-theme
    fi
done
