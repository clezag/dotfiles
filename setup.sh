#!/bin/bash
DOTFILES=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ln -s $DOTFILES/.alacritty.toml ~/.alacritty.toml

# labwc desktop
cat pkg.txt | xargs sudo dnf install
ln -s $DOTFILES/.config/labwc/ ~/.config/labwc
ln -s $DOTFILES/.config/sfwbar/ ~/.config/sfwbar

