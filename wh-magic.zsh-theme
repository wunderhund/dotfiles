# Primarily ripped off from the af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
# Date formatting taken from: https://gist.github.com/asimihsan/5277137

# If you use virtualenv, enable virtualenv plugin for zsh:
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/virtualenv

# Vagrant prompt adapted from the vagrant-prompt plugin by Alberto Re:
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vagrant-prompt/vagrant-prompt.plugin.zsh

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
eval pyenv_color='$FG[221]'
eval tf_prompt_color='$FG[045]'
eval vagrant_bracket_color='$FG[033]'
eval vagrant_running_color='$FG[002]'
eval vagrant_saved_color='$FG[003]'
eval vagrant_notcreated_color='$FG[245]'
eval vagrant_stopped_color='$FG[001]'

# Primary prompt
PS1='%(?..%{$error_color%}[%?]%{$reset_color%})\
$(virtualenv_prompt_info)%{$reset_color%}\
%{$pyenv_color%}$(pyprompt)%{$reset_color%}\
$(vagrant_status_info)\
$tf_prompt_color$(tf_prompt_info)%{$reset_color%}\
%{$path_color%}%~%{$reset_color%}\
$(git_prompt_info)%{$reset_color%}\
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
ZSH_THEME_VIRTUALENV_PREFIX="%{$venv_bracket_color%}[%{$venv_color%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$venv_bracket_color%}]%{$reset_color%}"

# PYENV Function
# This checks if the user has pyenv installed and if so, 
# adds the active python version to the beginning of the prompt.
function pyprompt () {
  ZSH_THEME_PYENV_LOCAL=$(pyenv local) 2>/dev/null
  ZSH_THEME_PYENV_GLOBAL=$(pyenv global) 2>/dev/null
  if [[ ! -z "$ZSH_THEME_PYENV_LOCAL" ]]; then
    ZSH_THEME_PYENV_ACTIVE=$ZSH_THEME_PYENV_LOCAL
  elif [[ -z "$ZSH_THEME_PYENV_LOCAL" ]]; then
    ZSH_THEME_PYENV_ACTIVE=$ZSH_THEME_PYENV_GLOBAL
  fi
  if [[ $PYENV_SHELL -eq 'zsh' ]] && [[ $ZSH_THEME_PYENV_ACTIVE != 'system' ]]; then
    echo "[$(python -V 2>&1 | grep Python | cut -f 2 -d ' ')]"
  fi
}

# Vagrant Prompts
ZSH_THEME_VAGRANT_PREFIX="%{$vagrant_bracket_color%}["
ZSH_THEME_VAGRANT_SUFFIX="%{$vagrant_bracket_color%}]%{$reset_color%}"

# Vagrant Function
function vagrant_status_info() {
  if [[ -d .vagrant && -f Vagrantfile ]]; then
    statuses=$(vagrant status 2> /dev/null | ggrep -P "\w+\s+[\w\s]+\s\(\w+\)")
    statuses=("${(f)statuses}")
    for vm_details in $statuses; do
      vm_name=$(echo $vm_details | ggrep -o -P "^\w+")
      vm_state=$(echo $vm_details | ggrep -o -E "running|saved|not created|poweroff")
      printf '%s' $ZSH_THEME_VAGRANT_PREFIX
      if [[ "$vm_state" == "running" ]]; then
        printf '%s' "%{$vagrant_running_color%}$vm_name"
      elif [[ "$vm_state" == "saved" ]]; then
        printf '%s' "%{$vagrant_saved_color%}$vm_name"
      elif [[ "$vm_state" == "not created" ]]; then
        printf '%s' "%{$vagrant_notcreated_color%}$vm_name"
      elif [[ "$vm_state" == "poweroff" ]]; then
        printf '%s' "%{$vagrant_stopped_color%}$vm_name"
      fi
      printf '%s' $ZSH_THEME_VAGRANT_SUFFIX
    done
  fi
}
