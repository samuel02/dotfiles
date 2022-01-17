# random
alias reload!='. ~/.zshrc'
alias be='bundle exec'
alias tmux="tmux -2"
alias h="clear && cd ~"
alias ppath='echo $PATH | tr -s ":" "\n"'
alias dc="docker-compose"

# fasd
alias z='fasd_cd -d' # cd, same functionality as j in autojump

# colors
if [[ "$(uname)" = "Darwin" ]]; then
  eval $(gdircolors ~/.dircolors)
  alias ls="gls -F --color"
else
  eval $(dircolors ~/.dircolors)
  alias ls="ls -F --color"
fi

alias ll="ls -la --color"
alias grep="grep --color=auto"

# git
alias gp='git push'
alias gl='git pull --prune'
alias gs='git status -sb'
alias glg='git lg'
alias gd='git diff'

# kubernetes
alias k=kubectl
# complete -F __start_kubectl k
