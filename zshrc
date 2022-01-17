# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/.dotfiles

# load custom executable functions
for function in $DOTFILES/zsh/functions/*; do
  source $function
done

source $DOTFILES/zsh/config.zsh
source $DOTFILES/zsh/env.zsh
source $DOTFILES/zsh/fasd.zsh
source $DOTFILES/zsh/fzf.zsh
source $DOTFILES/zsh/prompt.zsh
source $DOTFILES/zsh/completion.zsh
source $DOTFILES/zsh/path.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# setup colors
source $DOTFILES/zsh/colors.zsh

# setup aliases
source $DOTFILES/zsh/aliases.zsh

# setup keys
source $DOTFILES/zsh/keys.zsh

# local config
source ~/.localrc

# direnv
eval "$(direnv hook zsh)"

# rbenv
eval "$(rbenv init -)"
