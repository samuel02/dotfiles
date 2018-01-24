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

# Copy example files
echo "› add local config files"
for file in "$HOME"/.dotfiles/*.example; do
  basename=`basename $file`
  src=$file
  dest="$HOME/.${basename%.*}"

  cp -v -n $src $dest
done

# Install vim plugins
echo "› install vim-plug"
if [ -e "$HOME"/.vim/autoload/plug.vim ]; then
  vim -E -s +PlugUpgrade +qa
else
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "› install vim plugins"
vim -u "$HOME"/.vimrc.bundles +PlugUpdate +PlugClean! +qa
