clear() {
  if [[ -v TMUX ]]; then
    /usr/bin/clear && tmux clear-history
  else
    /usr/bin/clear
  fi
}
