# allow ctrl-r to perform backward search in history
#bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

if [[ "$(uname)" = "Darwin" ]]; then
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
else
  source "/usr/share/fzf/key-bindings.zsh"
fi
