# Generated from installation wizard
setopt appendhistory autocd extendedglob nomatch
zstyle :compinstall filename '/home/oliver/.zshrc'
autoload -Uz compinit
unsetopt beep
compinit

# Nvim-like pager with incremental fast search
PAGER=nvimpager

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000

# Vi mode
bindkey -v
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Nicely coloured ls (requires terminal palette to be set to solarized)
eval `dircolors ~/.solarized.dircolors`

. $HOME/.zsh/plugins/bd/bd.zsh

# | ------------------------------------------------------------------------- |
# |               Latex                                                       |
# | ------------------------------------------------------------------------- |

export BSTINPUTS=".:$HOME/texmf//::"
export TEXINPUTS=".:$HOME/texmf//::"

# | ------------------------------------------------------------------------- |
# |               Oh-My-Zsh                                                   |
# | ------------------------------------------------------------------------- |

# Path to oh-my-zsh installation.
export ZSH="/home/oliver/.oh-my-zsh"

plugins=(fzf tmux cp colored-man-pages vi-mode)
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOQUIT="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# | ------------------------------------------------------------------------- |
# |                   Prompt                                                  |
# | ------------------------------------------------------------------------- |

# Custom prompt for virtualenv
# Disable the default virtualenv prompt change:
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Get venv state
function virtualenv_info(){
    if [[ -n "$VIRTUAL_ENV" ]]; then
	echo " ○" && return
    fi
    echo " ➜"
}
PROMPT_CHAR="$(virtualenv_info)"

# (prompt indicates return of previous command by colour) ➜
# Uses terminal palette
autoload -U colors && colors
PROMPT="%(?:%F{green}${PROMPT_CHAR} %1~ %{$reset_color%}:%F{red}${PROMPT_CHAR} %1~ %{$reset_color%})"

# | ------------------------------------------------------------------------- |
# |                   Aliases, Functions, Env                                 |
# | ------------------------------------------------------------------------- |

# Source aliases, functions and environment variables
source $HOME/.aliases
source $HOME/.functions
source $HOME/.zsh_env

export VISUAL='nvim'
export EDITOR='nvim'

# | ------------------------------------------------------------------------- |
# |                   FZF (keep near end)                                     |
# | ------------------------------------------------------------------------- |
#
if whence fzf > /dev/null
then
	export FZF_BASE="/home/oliver/.fzf/bin/fzf"
	export DISABLE_FZF_KEY_BINDINGS="false"
	export FZF_DEFAULT_OPTS="--height=40% --border --margin=1 --padding=1 --layout=reverse"
	if whence fd  > /dev/null
	then
		# Makes fzf faster (needs fd installed)
		export FZF_DEFAULT_COMMAND='fd -H --type f'
	fi
fi
# Assumes installed and configured fzf, see here: https://github.com/junegunn/fzf
bindkey "^R" fzf-history-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
