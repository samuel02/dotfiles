#!/usr/bin/env zsh
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export GREP_COLOR='4;31'

# export MANROFFOPT='-c'
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
# export LESS_TERMCAP_me=$(tput sgr0)
# export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
# export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
# export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
# export LESS_TERMCAP_mr=$(tput rev)
# export LESS_TERMCAP_mh=$(tput dim)
# export LESS_TERMCAP_ZN=$(tput ssubm)
# export LESS_TERMCAP_ZV=$(tput rsubm)
# export LESS_TERMCAP_ZO=$(tput ssupm)
# export LESS_TERMCAP_ZW=$(tput rsupm)

if (( $+commands[grc] )); then

  function df(){
    =grc --colour=auto $(whence df) -h "$@"
  }

  function as(){
    =grc --colour=auto $(whence as) "$@"
  }

  function diff(){
    =grc --colour=auto $(whence diff) --color "$@"
  }

  if (( $+commands[dig] )); then
    function dig(){
      =grc --colour=auto $(whence dig) "$@"
    }
  fi

  if (( $+commands[gas] )); then
    function gas(){
      =grc --colour=auto $(whence gas) "$@"
    }
  fi

  if (( $+commands[gcc] )); then
    function gcc(){
      =grc --colour=auto $(whence gcc) "$@"
    }
  fi

  if (( $+commands[g++] )); then
    function g++(){
      =grc --colour=auto $(whence g++) "$@"
    }
  fi

  if (( $+commands[last] )); then
    function last(){
      =grc --colour=auto $(whence last) "$@"
    }
  fi

  if (( $+commands[ld] )); then
    function ld(){
      =grc --colour=auto $(whence ld) "$@"
    }
  fi

  if (( $+commands[ifconfig] )); then
    function ifconfig(){
      =grc --colour=auto $(whence ifconfig) "$@"
    }
  fi

  if (( $+commands[mount] )); then
    function mount(){
      =grc --colour=auto $(whence mount) "$@"
    }
  fi

  if (( $+commands[mtr] )); then
    function mtr(){
      =grc --colour=auto $(whence mtr) "$@"
    }
  fi

  if (( $+commands[netstat] )); then
    function netstat(){
      =grc --colour=auto $(whence netstat) "$@"
    }
  fi

  if (( $+commands[ping] )); then
    function ping(){
      =grc --colour=auto $(whence ping) "$@"
    }
  fi

  if (( $+commands[ping6] )); then
    function ping6(){
      =grc --colour=auto $(whence ping6) "$@"
    }
  fi

  if (( $+commands[ps] )); then
    function ps(){
      =grc --colour=auto $(whence ps) "$@"
    }
  fi

  if (( $+commands[traceroute] )); then
    function traceroute(){
      =grc --colour=auto $(whence traceroute) "$@"
    }
  fi

fi

# set color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=010'
