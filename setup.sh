#!/bin/bash
DOTFILES=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${XDG_CONFIG_HOME}" ]]; then
	XDG_CONFIG_HOME=~/.config
fi

# alacritty
ln -s $DOTFILES/.alacritty.toml ~/.alacritty.toml
mkdir -p $XDG_CONFIG_HOME/alacritty/
git clone git@github.com:alacritty/alacritty-theme.git $XDG_CONFIG_HOME/alacritty/alacritty-theme

# vim
ln -s $DOTFILES/.vimrc ~/.vimrc
ln -s $DOTFILES/.vim ~/.vim

# zsh
ln -s $DOTFILES/.zshrc ~/.zshrc

for arg in $@
do
	if [[ arg -eq "labwc" ]];
	then
		# labwc desktop
		cat pkg.txt | xargs sudo dnf install
		ln -s $DOTFILES/.config/labwc/ ~/.config/labwc
		ln -s $DOTFILES/.config/sfwbar/ ~/.config/sfwbar
	fi

done

