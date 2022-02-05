#!/bin/bash

my_selection(){
	if [[ $DISPLAY == "" ]]; then
		fzf
	else 
		rofi -dmenu -p "$1"
	fi
}

cd ~/.dotfiles

# Find all apps in 'stow'-dir and the scripts dir and none
APPS=$(ls ~/.dotfiles/stow; echo "scripts"; echo "none")
APP=$(echo "${APPS}" | my_selection app)
[[ $APP == "" ]] && exit 0

# Scripts was chosen
case "$APP" in
	"scripts")
		# Let user pick script and open it in vim
		cd ~/.dotfiles/scripts
		ls | my_selection script | xargs -o -I % nvim %
	;;
	"none")
		exec zsh
		exit 0
	;;
	*)
		# Find all config files for app, choose one and open in vim
		fd -t f -H . stow/"$APP" \
			| while read LINE; do echo "${LINE#*/*/}"; done \
			| my_selection file \
			| xargs -I % echo stow/$APP/% \
			| xargs -o -I % nvim %
	;;
esac
