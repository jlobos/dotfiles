local ret_status="%(?:%{$fg_bold[magenta]%} ◯ :%{$fg_bold[red]%}◯ )"
PROMPT='${ret_status} %{$reset_color%}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{242}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{242} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""
