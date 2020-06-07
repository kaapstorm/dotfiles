PROMPT='[%*] %{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) '
PROMPT+="%(?:%{$fg[green]%}%(!.#.$):%{$fg_bold[red]%}%(!.#.$))%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
