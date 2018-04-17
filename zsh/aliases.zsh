# random
alias reload!='. ~/.zshrc'
alias be='bundle exec'
alias tmux="TERM=screen-256color tmux"
alias h="clear && cd ~"
alias t="task limit:5"
alias ppath='echo $PATH | tr -s ":" "\n"'

# fasd
alias z='fasd_cd -d' # cd, same functionality as j in autojump

# colors
eval $(gdircolors ~/.dircolors)
alias ls="gls -F --color"
alias ll="ls -la --color"
alias grep="grep --color=auto"

# git
alias gp='git push'
alias gl='git pull --prune'
alias gs='git status -sb'
alias glg='git lg'
alias gd='git diff'
