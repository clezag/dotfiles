#!/bin/bash
DOTFILES=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${XDG_CONFIG_HOME}" ]]; then
	XDG_CONFIG_HOME=~/.config
fi

for arg in $@
do
	case $arg in
		labwc)
			# labwc desktop
			cat $DOTFILES/pkg.d/labwc | xargs sudo dnf install
			ln -s $DOTFILES/.config/labwc/ ~/.config/labwc
			ln -s $DOTFILES/.config/sfwbar/ ~/.config/sfwbar
			;;

		term)
			cat $DOTFILES/pkg.d/term | xargs sudo dnf install

			# vim
			ln -s $DOTFILES/.vimrc ~/.vimrc
			ln -s $DOTFILES/.vim ~/.vim

			# zsh
			ln -s $DOTFILES/.zshrc ~/.zshrc
			;;
		gui)
			cat $DOTFILES/pkg.d/gui | xargs sudo dnf install

			# alacritty
			ln -s $DOTFILES/.alacritty.toml ~/.alacritty.toml
			mkdir -p $XDG_CONFIG_HOME/alacritty/
			git clone git@github.com:alacritty/alacritty-theme.git $XDG_CONFIG_HOME/alacritty/alacritty-theme
			;;
	esac
done

