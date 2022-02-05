# Symlink to ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

case "$TERM" in
    xterm-color|*-256color) 
        PS1='\[\033[01;34m\]\w\[\033[00m\] '
    ;;
    xterm*|rxvt*)
	PS1="\[\e]0;\w\a\]$PS1"
    ;;
    *)
        PS1='\w\$ '
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ${HOME}/.solarized.dircolors && eval "$(dircolors -b ${HOME}/.solarized.dircolors)" 
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi


test -f ${HOME}/.aliases && . ${HOME}/.aliases
test -f ${HOME}/.functions && . ${HOME}/.functions
test -f ${HOME}/.zsh_env && . ${HOME}/.zsh_env

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set the number of directories shown in the bash prompt
PROMPT_DIRTRIM=2

# Set the command line editing mode to vi-style
set -o vi

# FZF 
test -f ${HOME}/.fzf.bash && source ${HOME}/.fzf.bash
