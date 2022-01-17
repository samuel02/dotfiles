export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_COMPLETION_TRIGGER='...'
export FZF_COMPLETION_OPTS='--border --info=inline'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Setup fzf
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "$HOME/.fzf/shell/key-bindings.zsh"
