# Primarily ripped off from the af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
# Date formatting taken from: https://gist.github.com/asimihsan/5277137

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# color vars
eval my_path='$FG[075]'
eval my_gray='$FG[245]'
eval date_gray='$FG[242]'
eval my_orange='$FG[214]'

# primary prompt
PROMPT='%(?..%{$fg[red]%}[%?] %{$reset_color%})$my_path%~\
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# local time, color coded by last return code
time="%(?.%{$fg[date_gray]%}.%{$fg[red]%})%D{%Y-%m-%d %H:%M:%S}%{$reset_color%}"

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
	RPROMPT='$(virtualenv_prompt_info)$date_gray%n@%m $time%{$reset_color%}%'
else
	RPROMPT='$my_gray%n@%m $time%{$reset_color%}%'
fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[031]($FG[040]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[031])%{$reset_color%}"
