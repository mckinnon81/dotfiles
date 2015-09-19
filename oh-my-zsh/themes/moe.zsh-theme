# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
# It might be bash like, but I can't have my co-workers knowing I use zsh

for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
if [ "$EUID" -ne 0 ]; then
    PROMPT='%{$fg_bold[white]%}[%{$fg_bold[green]%}%n%{$fg_bold[white]%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$fg_bold[white]%}]%{$reset_color%}%(!.#.$) '
else
    PROMPT='%{$fg_bold[white]%}[%{$fg_bold[red]%}%n%{$fg_bold[white]%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$fg_bold[white]%}]%{$reset_color%}%(!.#.$) '
fi

RPS1='$(git_prompt_info)$(git_prompt_status) $(svn_prompt_info) %{$reset_color%}'

PR_RESET="%{$reset_color%}"
VCS_DIRTY_COLOR="${PR_RESET}${PR_BOLD_YELLOW}"
VCS_CLEAN_COLOR="${PR_RESET}${PR_BOLD_GREEN}"
# ########## COLOR ###########
# ########## SVN ###########
ZSH_THEME_SVN_PROMPT_PREFIX="${PR_RESET}${PR_BOLD_RED}[svn:"
ZSH_THEME_SVN_PROMPT_SUFFIX="${PR_RESET}${PR_BOLD_RED}]"
ZSH_THEME_SVN_PROMPT_DIRTY="${VCS_DIRTY_COLOR} ✘${VCS_SUFIX_COLOR}"
ZSH_THEME_SVN_PROMPT_CLEAN="${VCS_CLEAN_COLOR} ✔${VCS_SUFIX_COLOR}"
# ########## SVN ###########
# ########## GIT ###########
ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}${PR_BOLD_RED}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="${PR_RESET}${PR_BOLD_GREEN}✚${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${PR_RESET}${PR_BOLD_BLUE}✹${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${PR_RESET}${PR_BOLD_RED}✖${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${PR_RESET}${PR_BOLD_MAGENTA}➜${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_RESET}${PR_BOLD_YELLOW}═${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_RESET}${PR_BOLD_CYAN}✭${PR_RESET}"
# ########## GIT ###########
