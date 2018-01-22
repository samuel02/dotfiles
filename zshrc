# Must be set in order to exclude files
# when globbing for all config files
setopt EXTENDED_GLOB

# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

# local config
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/zsh/*.zsh)

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files
