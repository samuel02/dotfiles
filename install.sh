#!/bin/sh

indent() { sed 's/^/  /'; }
info() { echo "› \033[0;32m$1\033[0m"; }

DOTFILES="$HOME/.dotfiles"

# Install homebrew unless already installed
if test ! "$(command -v brew)"; then
  echo "› installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homewbrew formulas
info "brew update"
brew update | indent

# Install all formulas in Brewfile
info "brew bundle"
brew bundle | indent

# Set shell
# If this user's login shell is not already "zsh", attempt to switch.
test_current_shell=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$test_current_shell" != "zsh" ]; then
  info "set shell to zsh"
  chsh -s "$(grep /zsh$ /etc/shells | tail -1)"
fi

# Setup dotfiles
info "setup dotfiles"
RCRC="$DOTFILES/rcrc" rcup

# Copy example files
info "add local config files"
for file in "$HOME"/.dotfiles/*.example; do
  basename="$(basename "$file")"
  src=$file
  dest="$HOME/.${basename%.*}"

  cp -v -n "$src" "$dest" | indent
done

# Install vim plugins
info "install vim-plug"
if [ -e "$HOME"/.vim/autoload/plug.vim ]; then
  vim -E -s +PlugUpgrade +qa
else
  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | indent
fi

info "install vim plugins"
vim +PlugUpdate +PlugClean! +qa

# Setup bat(https://github.com/sharkdp/bat)
bat_config_dir="$(bat cache --config-dir)"
bat_themes_dir="$bat_config_dir/themes"
bat_solarized_theme="$bat_themes_dir/Solarized-1"
if [ ! -d "$bat_solarized_theme" ]; then
  info "setup bat"
  mkdir -p "$bat_themes_dir"
  git clone "https://github.com/drewish/Solarized-1" "$bat_solarized_theme"
  bat cache --init
fi
