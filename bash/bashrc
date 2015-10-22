# User dependent .bashrc file
# If not running interactively, don't do anything


[[ "$-" != *i* ]] && return

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

parse_git_branch () {
      git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}

parse_svn_branch() {
      parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
}

parse_svn_url() {
      svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
      svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

# Shell Options
set -o notify
set -o ignoreeof
shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell

# Completion options
COMP_CVS_REMOTE=1
COMP_CONFIGURE_HINTS=1
COMP_TAR_INTERNAL_PATHS=1

[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# Aliases

if [ -f "${HOME}/.bash_aliases" ]; then
   source "${HOME}/.bash_aliases"
fi


if [ -f "${HOME}/.bash_colors" ]; then
   source "${HOME}/.bash_colors"
fi


# Default Programs
export EDITOR="vim"
export PAGER="less"
export BROWSER="google-chrom-stable"
export MOVPLAY="vlc"
export PICVIEW="feh"
export SNDPLAY="vlc"
export TERMINAL="xfce4-terminal"
export SVN_EDITOR=vim

# File Extensions
for ext in html org php com net no; do alias $ext=$BROWSER; done
for ext in txt tex py PKGBUID; do alias $ext=$EDITOR; done
for ext in png jpg gif; do alias $ext=$PICVIEW; done
for ext in mpg wmv avi mkv; do alias $ext=$MOVPLAY; done
for ext in wav mp3 ogg; do alias $ext=$SNDPLAY; done


# Display the current git branch in the command prompt
if [ "$EUID" -ne 0 ]; then
    export PS1="$IWhite[$IGreen\u$IWhite@$IBlue\h $IYellow\w $ICyan\$(parse_git_branch)\$(parse_svn_branch)$IWhite]\$ "
else
    export PS1="$IWhite[$IRed\u$IWhite@$IBlue\h $IYellow\w$ICyan\$(parse_git_branch)\$(parse_svn_branch)$IWhite]\$ "
fi

if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" == "xfce4-terminal" ]; then
    export TERM=xterm-256color
fi

if [[ -n "$DISPLAY" && "$TERM" = "xterm" ]]; then 
    export TERM=xterm-256color 
fi

archey
