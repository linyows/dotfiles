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

# git status
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[%{$my_light_gray%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]%{$reset_color%}"

# sorted by priority
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$my_pink%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[purple]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$my_dark_navy%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[black]%}"

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

# main prompt
PROMPT='%{$fg_bold[blue]%}%p%{$fg[blue]%}%c %{$fg_bold[cyan]%}$(git_prompt_info)%{$my_green%} % $(git_prompt_status)$prompt_cross%{$reset_color%} '

function rbenv_current_version() {
    ruby_version=$(rbenv_prompt_info 2> /dev/null) || return
    echo "$ruby_version"
}

# right prompt
RPROMPT='$FG[236]%n@%m $FG[238]$(rvm_prompt_info || rbenv_current_version) $FG[240]$PWD%{$reset_color%}%'
