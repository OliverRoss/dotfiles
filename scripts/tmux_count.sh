#!/bin/bash

# get solarized colours
source ~/.dotfiles/scripts/solarized.sh
COLOR_INACTIVE="$SOL_BASE2" 
COLOR_ACTIVE="$SOL_ORANGE" 
SEPARATOR="|"
DELIM_LEFT="["
DELIM_RIGHT="]"

# does tmux even run?
tmux ls &> /dev/null
if [ $? -ne 0 ]
then
	exit 0
fi

# print active tmux sessions in this format : session | session | session
OUTPUT_STRING=`tmux ls\
	| awk -F " " '{print $1}'\
	| sed -e "s/:/ $SEPARATOR /" \
	| tr -d "\n" \
	| sed -e "s/$SEPARATOR $//g"`

# get window name of focused i3 window
ACTIVE_WINDOW_NAME=`i3-msg -t get_tree \
	| grep -o -e 'focused":true,\([^,]*,\)\{23\}' \
	| grep -o -e '"name":".*' \
	| grep -o -e '[^"]*",' \
	| cut -d\" -f1`

ACTIVE_WIN_IS_TMUX="false"
# If tmux is contained in the window title it is a tmux session
if $(echo $ACTIVE_WINDOW_NAME | grep -q tmux )
then
	ACTIVE_WIN_IS_TMUX="true"
fi

# if it is a tmux window, colorize the output
if [[ $ACTIVE_WIN_IS_TMUX == "true" ]]
then
	# Need to cut the tmux session name part differently from the window
	# title if it was started # from script

	if $(echo $ACTIVE_WINDOW_NAME | grep -q crypt )
	then
		ACTIVE_SESSION="crypt"
	elif $(echo $ACTIVE_WINDOW_NAME | grep -q home )
	then
		ACTIVE_SESSION="home"
	elif $(echo $ACTIVE_WINDOW_NAME | grep -q rpg )
	then
		ACTIVE_SESSION="rpg"
	elif $(echo $ACTIVE_WINDOW_NAME | grep -q infosec )
	then
		ACTIVE_SESSION="infosec"
	elif $(echo $ACTIVE_WINDOW_NAME | grep -q config )
	then
		ACTIVE_SESSION="config"
	else
		ACTIVE_SESSION=`echo $ACTIVE_WINDOW_NAME | cut -d ' ' -f 7`
	fi

	# Add color to active session
	ACTIVE_SESSION_COLOR="%{F$COLOR_ACTIVE}$ACTIVE_SESSION%{F$COLOR_INACTIVE}"

	# Replace the session name in the output string with the coloured
	# version
	OUTPUT_STRING=`echo $OUTPUT_STRING \
		| sed -e "s/\<$ACTIVE_SESSION\>/$ACTIVE_SESSION_COLOR/g"`

	# The different echos account for a one-off space diff between highlighted
	# and non-highlighted output, that I'm too dumb to debug
	echo "%{F$COLOR_INACTIVE}$DELIM_LEFT $OUTPUT_STRING $DELIM_RIGHT"
else
	echo "%{F$COLOR_INACTIVE}$DELIM_LEFT ${OUTPUT_STRING}$DELIM_RIGHT"
fi

