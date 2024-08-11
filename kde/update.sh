#!/bin/bash

konsave -s eldskald -f
konsave -e eldskald -d ~/dotfiles/kde -n eldskald
split ~/dotfiles/kde/eldskald.knsv -n 20
rm ~/dotfiles/kde/eldskald.knsv
