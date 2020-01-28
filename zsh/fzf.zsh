# Default opts
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Use ... as the trigger sequence instead of the default **
  export FZF_COMPLETION_TRIGGER='...'

  export FZF_DEFAULT_COMMAND="fd --type f \
                                 --hidden \
                                 --no-ignore \
                                 --follow \
                                 --exclude .git \
                                 --exclude .git-crypt \
                                 --exclude .gem \
                                 --exclude node_modules \
                                 --exclude coverage \
                                 --exclude .direnv \
                                 --exclude tmp \
                                 --exclude .build-debug \
                                 --exclude install \
                                 --exclude .ccls-cache"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
}

_gen_fzf_default_opts

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
