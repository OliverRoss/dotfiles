#!/bin/bash

print_usage(){
	echo "Usage: ./spawn_tmux.sh /path/to/working/dir tmux_sess_name [command]"
	echo ""
	echo "Will spawn or attach to session called 'tmux_sess_name' and "
	echo "create it, if it doesn't exist. Within that session 'zsh' or"
	echo "optionally the provided command will be executed."
}

check_args(){
	if [  $# -lt 2 ] 
	then
		print_usage
		exit 1
	fi

	if ! [[ -d $1 ]]
	then
		echo "$1 is not a valid dir."
		exit 1
	fi
}

parse_args(){
	WORKING_DIR=$1
	shift
	TMUX_SESSION_NAME=$1
	shift
	if [[ $# -eq 0 ]]
	then
		COMMAND="zsh"
	else
		COMMAND="$@"
	fi

}

spawn_tmux(){
	tmux ls | grep $TMUX_SESSION_NAME &>/dev/null
	SESSION_EXISTS=$?
	if [[ $SESSION_EXISTS -eq 0  ]]
	then
		tmux -2 attach -t $TMUX_SESSION_NAME
	else
		cd $WORKING_DIR 
		tmux new -s $TMUX_SESSION_NAME "$COMMAND"
	fi
}

main(){
	check_args "$@"
	parse_args "$@"
	spawn_tmux "$@"
}

main "$@"
