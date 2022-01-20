source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

export DOTFILES=$HOME/.dotfiles

source $DOTFILES/zsh/config.zsh
source $DOTFILES/zsh/env.zsh
source $DOTFILES/zsh/fasd.zsh
source $DOTFILES/zsh/fzf.zsh
source $DOTFILES/zsh/prompt.zsh
source $DOTFILES/zsh/completion.zsh
source $DOTFILES/zsh/path.zsh
source $DOTFILES/zsh/colors.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/keys.zsh

source ~/.localrc

# load custom executable functions
for function in $DOTFILES/zsh/functions/*; do
  source $function
done

# direnv
eval "$(direnv hook zsh)"

# rbenv
eval "$(rbenv init -)"
