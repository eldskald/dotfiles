# Rafael Bordoni's dotfiles

WIP

## Dependencies

These dotfiles are for [neovim](https://neovim.io) with [ripgrep](https://github.com/BurntSushi/ripgrep), [zsh](https://wiki.archlinux.org/title/zsh) with [oh-my-zsh](https://ohmyz.sh/) and [alacritty](https://alacritty.org/), with the font [HurmitNerdFont](alacritty/Hermit.zip).

## Instructions

First, clone or download this repository into your home directory. It must be on the home directory. Install the [HurmitNerdFont](Hermit.zip) on your system and then run `sh install.sh`.

You can also append `neovim`, `zsh` or `alacritty` to `sh install.sh` to install just the configurations for said tool, for example running `sh install.sh neovim` will just install the [neovim](https://neovim.io) configurations. You can install two too by doing `sh install.sh neovim alacritty`, for example. Running `sh install.sh` is the same as `sh install neovim alacritty zsh`.

After that, modifying the contents of the files in this directory should modify the configurations for [neovim](https://neovim.io), [zsh](https://wiki.archlinux.org/title/zsh) and [alacritty](https://alacritty.org/).

If you want to uninstall, just run `sh uninstall.sh`. And just like the install script, you can also append `neovim`, `zsh` or `alacritty` to uninstall just the configs for said software.
