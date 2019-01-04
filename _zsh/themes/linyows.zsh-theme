# linyows.zsh-theme
#
# Author: linyows
# URL: http://linyo.ws/

# color vars
eval my_gray='$FG[237]'
eval my_light_gray='$FG[243]'
eval my_orange='$FG[214]'
eval my_navy='$FG[032]'
eval my_dark_navy='$FG[024]'
eval my_purple='$FG[105]'
eval my_green='$FG[048]'
eval my_pink='$FG[199]'

# mark
prompt_zigzag='⚡'
prompt_cross='✝ '
prompt_arrow='»'
prompt_anchor='⚓'
prompt_cloud='☁ '
prompt_ok='✔ '
prompt_ng='✘ '
prompt_note1='♪ '
prompt_note2='♬'
prompt_tree='🌴'
prompt_surfin='🏄'
prompt_basketball='🏀'

# git status
ZSH_THEME_GIT_PROMPT_PREFIX="%{$my_light_gray%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$my_green%}"
ZSH_THEME_GIT_PROMPT_DIRTY=$prompt_basketball
ZSH_THEME_GIT_PROMPT_CLEAN=$prompt_surfin

# sorted by priority
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%}"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$my_pink%}"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[purple]%}"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$my_dark_navy%}"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[black]%}"

# main prompt
#PROMPT='%{$fg_bold[blue]%}%p%{$fg[blue]%}%c %{$fg_bold[cyan]%}$(my_git_prompt_info)%{$my_green%} % $(git_prompt_status)$prompt_cross%{$reset_color%} '
PROMPT='%{$my_navy%}%p%c $(my_git_prompt_info)'

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [ "$ref" = '' ]; then
    echo "$prompt_tree "
    return
  fi
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX $(parse_git_dirty) "
}

# right prompt
#RPROMPT='$FG[236]%n@%m $FG[238]$(rbenv_current_version || rvm_current_version) $FG[240]$PWD%{$reset_color%}%'
RPROMPT='%{$my_light_gray%}%n@%m %{$my_navy%}$PWD%{$reset_color%}'
