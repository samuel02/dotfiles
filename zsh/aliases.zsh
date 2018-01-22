# random
alias reload!='. ~/.zshrc'
alias be='bundle exec'
alias tmux="TERM=screen-256color tmux"
alias h="clear && cd ~"
alias t="task limit:5"
alias ppath='echo $PATH | tr -s ":" "\n"'

# fasd
alias a='fasd -a' # any
alias s='fasd -si' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # interactive directory jump

# colors
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  # GRC colorizes nifty unix tools all over the place
  source `brew --prefix`/etc/grc.bashrc
fi

if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
alias grep="grep --color=auto"

# git
alias gp='git push'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'
