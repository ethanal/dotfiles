# Based on lukerandall theme

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}$ '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}] %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}●"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[cyan]%}●"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}●"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[white]%}●"

