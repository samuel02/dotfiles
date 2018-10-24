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

# Install all formulas in Brewfile
echo "› brew bundle"
brew bundle

# Set shell
# If this user's login shell is not already "zsh", attempt to switch.
TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
  echo "› chsh -s /usr/local/bin/zsh"
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi

# Install python packages
echo "› installing python packages"
pip3 install gcalcli pygments --pre
curl https://raw.githubusercontent.com/gthank/solarized-dark-pygments/master/solarized256.py \
  --output /usr/local/lib/python3.7/site-packages/pygments/styles/solarized256.py

# Setup dotfiles
echo "› setup dotfiles"
RCRC="$DOTFILES/rcrc" rcup

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

# Setup bat(https://github.com/sharkdp/bat)
echo "› install bat"
BAT_CONFIG_DIR="$(bat cache --config-dir)"

mkdir -p "$BAT_CONFIG_DIR/themes"
cd "$BAT_CONFIG_DIR/themes"
git clone https://github.com/drewish/Solarized-1

# Update the binary cache
bat cache --init
