#!/usr/bin/env bash

# Install homebrew unless already installed
if test ! $(which brew)
then
    echo "› installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homewbrew formulas
echo "› brew update"
brew update

# Install all formulas in Brewfile
echo "› brew bundle"
brew bundle

# Install python packages
echo "› installing python packages"
pip2 install gcalcli

# Setup dotfiles
echo "› setup dotfiles"
RCRC=~/.dotfiles/rcrc rcup
