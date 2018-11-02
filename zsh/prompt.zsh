autoload colors && colors

git_dirty() {
  if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1
  then
    if git diff --quiet --ignore-submodules HEAD
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  else
    echo ""
  fi
}

git_prompt_info () {
 ref=$(git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

export PROMPT=$'\n$(directory_name) $(git_dirty)\n› '
