if command -v fd > /dev/null; then
    FINDER="fd"
elif command -v fdfind > /dev/null; then
    FINDER="fdfind"
else
    FINDER="find"
fi

export FZF_DEFAULT_COMMAND="$FINDER --type f --hidden --follow --exclude .git"
export FZF_COMPLETION_TRIGGER='...'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS="--color=bg+:255,bg:231,border:237,spinner:127,hl:247,fg:237,header:247,info:136,pointer:127,marker:167,fg+:237,preview-bg:255,prompt:127,hl+:127"

_fzf_compgen_path() {
    $FINDER --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    $FINDER --type d --hidden --follow --exclude ".git" . "$1"
}

# Setup fzf
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "$HOME/.fzf/shell/key-bindings.zsh"
