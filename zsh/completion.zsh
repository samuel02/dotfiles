autoload -U compinit
compinit

zstyle ':completion:*' menu select

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
[[ $- == *i* ]] && command -v kubectl && source <(kubectl completion zsh) 2> /dev/null

fpath=(/usr/local/share/zsh-completions $fpath)
