#!/bin/bash

if [ $# == 0 ]
then
    sh install.sh neovim alacritty zsh kde
fi

for x in $@
do
    if [ $x == "neovim" ]
    then
        ln -s ~/dotfiles/nvim/ ~/.config/nvim
        mkdir ~/.config/nvim/lua/custom
        cp override-templates/override.lua.template ~/.config/nvim/lua/custom/override.lua
        cp override-templates/lsp-configs.lua.template ~/.config/nvim/lua/custom/lsp-configs.lua
        cp override-templates/none-ls-sources.lua.template ~/.config/nvim/lua/custom/none-ls-sources.lua
        cp override-templates/custom-plugins.lua.template ~/.config/nvim/lua/custom/custom-plugins.lua
    elif [ $x == "alacritty" ]
    then
        ln -s ~/dotfiles/alacritty/ ~/.config/alacritty
        cp override-templates/override.toml.template ./alacritty/override.toml
    elif [ $x == "zsh" ]
    then
        ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
        ln -s ~/dotfiles/zsh/eldskald.zsh-theme ~/.oh-my-zsh/custom/themes/eldskald.zsh-theme
        cp override-templates/.zshrc_override.template ~/.zshrc_override
    elif [ $x == "kde" ]
    then
        konsave -r eldskald
        cat ~/dotfiles/kde/x* > ~/dotfiles/kde/eldskald.knsv
        konsave -i ~/dotfiles/kde/eldskald.knsv
        konsave -a eldskald
        rm ~/dotfiles/kde/eldskald.knsv
    fi
done
