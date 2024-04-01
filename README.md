# Rafael Bordoni's dotfiles

WIP

## Dependencies

These dotfiles are for [neovim](https://neovim.io) with [ripgrep](https://github.com/BurntSushi/ripgrep), [zsh](https://wiki.archlinux.org/title/zsh) with [oh-my-zsh](https://ohmyz.sh/) and [alacritty](https://alacritty.org/), with the font [HurmitNerdFont](alacritty/Hermit.zip).

## Installation

First, clone or download this repository into your home directory. It must be on the home directory. Install the [HurmitNerdFont](Hermit.zip) on your system, install dependencies and then run `sh install.sh`.

You can also append `neovim`, `zsh` or `alacritty` to `sh install.sh` to install just the configurations for said tool, for example running `sh install.sh neovim` will just install the [neovim](https://neovim.io) configurations. You can install two too by doing `sh install.sh neovim alacritty`, for example. Running `sh install.sh` is the same as `sh install neovim alacritty zsh`.

After that, modifying the contents of the files in this directory should modify the configurations for [neovim](https://neovim.io), [zsh](https://wiki.archlinux.org/title/zsh) and [alacritty](https://alacritty.org/).

## Uninstalling

Just run `sh uninstall.sh`. And just like the install script, you can also append `neovim`, `zsh` or `alacritty` to uninstall just the configs for said software.

## Updating

Just do `git pull` on this repository and configs for everything you're using will be updated.

## Customizing

Each dotfiles come with special files that are ignored by this repository to allow you to specific changes without preventing you from updating later with a `git pull`.

### Zsh

It is very useful to have specific aliases on different machines and there is no use keeping everything here on this repository.

After installing [zsh](https://wiki.archlinux.org/title/zsh) dotfiles, a `.zshrc_append` file will be added to your home folder. It is already being sourced by `.zshrc` and is ignored by this repository.

### Neovim

Every different machine will probably be working on different projects and thus be using its own different set of LSPs, linters and formatters and there is no point in keeping everything configured in this repository.

After installing [neovim](https://neovim.io) dotfiles, the directory `~/.config/nvim/lua/custom` will be created with the files `lsp-configs.lua` and `none-ls-sources.lua` just for that. There is also an `override.lua` file that will be sourced last on `init.lua` for other changes that might be necessary, like options or mappings.

### Alacritty

After installing the dotfiles, a `override.toml` file will be added to `~/.config/alacritty/` to change anything, like window opacity, mappings or font.
