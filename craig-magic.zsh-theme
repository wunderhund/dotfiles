# Primarily ripped off from the af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
# Date formatting taken from: https://gist.github.com/asimihsan/5277137

# If you use virtualenv, enable virtualenv plugin for zsh:
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/virtualenv

# If you like having user@machine displayed:
# eval user_host='%n@%m'
eval user_host=''

# Color vars
# Handy color number reference guide: https://i.stack.imgur.com/KTSQa.png
eval path_color='$FG[075]'
eval date_color='$FG[242]'
eval error_color='$FG[001]'
eval prompt_color='$FG[105]'
eval git_dirty_color='$FG[214]'
eval git_parens_color='$FG[031]'
eval git_branch_color='$FG[040]'
eval venv_bracket_color='$FG[165]'
eval venv_color='$FG[165]'

# Primary prompt
PS1='%(?..%{$error_color%}[%?] %{$reset_color%})\
$(virtualenv_prompt_info)%{$reset_color%}\
%{$path_color%}%~%{$reset_color%}\
$(git_prompt_info) %{$reset_color%}\
%{$prompt_color%}%(!.#.»)%{$reset_color%} '

# Secondary prompt (ongoing commands)
PS2='%{$prompt_color%}\ %{$reset_color%}'

# local time, color coded by last return code
time="%(?.%{$date_color%}.%{$error_color%})%D{%Y-%m-%d %H:%M:%S}%{$reset_color%}"

# Right prompt
RPS1='$date_color$user_host  $time%{$reset_color%}%'

# git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$git_parens_color%}(%{$git_branch_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$git_dirty_color%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$git_parens_color%})%{$reset_color%}"

# virtualenv prompt settings
ZSH_THEME_VIRTUALENV_PREFIX="%{$venv_bracket_color%}<%{$venv_color%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$venv_bracket_color%}> %{$reset_color%}"
