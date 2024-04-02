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
        mkdir ~/.config/nvim/lua/custom
        cp override.lua.example ~/.config/nvim/lua/custom/override.lua
        cp lsp-configs.lua.example ~/.config/nvim/lua/custom/lsp-configs.lua
        cp none-ls-sources.lua.example ~/.config/nvim/lua/custom/none-ls-sources.lua
    elif [ $x == "alacritty" ]
    then
        ln -s ~/dotfiles/alacritty/ ~/.config/alacritty
        cp override.toml.example ./alacritty/override.toml
    elif [ $x == "zsh" ]
    then
        ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
        ln -s ~/dotfiles/zsh/eldskald.zsh-theme ~/.oh-my-zsh/custom/themes/eldskald.zsh-theme
        cp .zshrc_append.example ~/.zshrc_append
    elif [ $x == "kde" ]
    then
        konsave -r eldskald
        cat ~/dotfiles/kde/x* > ~/dotfiles/kde/eldskald.knsv
        konsave -i ~/dotfiles/kde/eldskald.knsv
        konsave -a eldskald
    fi
done
