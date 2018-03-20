#!/bin/sh

DOTFILES="$HOME/.dotfiles"

# Install homebrew unless already installed
if test ! "$(which brew)"
then
    echo "› installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homewbrew formulas
echo "› brew update"
brew update

# Install mas-cli to handle Mac App Store apps
echo "› brew install mas"
brew install mas

# Install all formulas in Brewfile
echo "› brew bundle"
brew bundle

# Set shell
echo "› chsh -s /usr/local/bin/zsh"
brew bundle

# Install python packages
echo "› installing python packages"
pip2 install gcalcli pygments
curl https://raw.githubusercontent.com/gthank/solarized-dark-pygments/master/solarized256.py \
  --output /usr/local/lib/python2.7/site-packages/pygments/styles/solarized256.py

# Setup dotfiles
echo "› setup dotfiles"
RCRC="$DOTFILES/rcrc" rcup

# Setup kitty.conf
echo "› setup kitty.conf"
ln -s "$HOME/.config/kitty/kitty.conf" ~/Library/Preferences/kitty/kitty.conf

# Copy example files
echo "› add local config files"
for file in "$HOME"/.dotfiles/*.example; do
  basename="$(basename "$file")"
  src=$file
  dest="$HOME/.${basename%.*}"

  cp -v -n "$src" "$dest"
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
