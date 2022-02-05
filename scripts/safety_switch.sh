#!/bin/bash

print_usage(){
"usage: ./safety_switch.sh [opion] file cmd age warning_period"
"Execute cmd if file is older than age (in minutes). A warning is sent if the"
"time is only overdue by \`warning_period\` or less minutes."
"Options:"
"	-h: print help and exit."
"	--checkin: touch all /tmp files and close all notifications."
}

checkin(){
	touch /tmp/session_age
	touch /tmp/tomb_age
	dunstctl close-all
}

if [[ $1 == "-h" ]]
then
	print_usage	
	exit 0
fi

if [[ $1 == "--checkin" ]]
then
	checkin
	exit 0
fi

# If file or option does not exist: exit
if !([[ -f $1 ]])
then
	exit 0
fi

# Global constants
FILE="$1"
CMD="$2"
EXPIRATION_DEADLINE="$3"
WARNING_PERIOD="$4"

# Get age of file in minutes
get_age(){
	CUR_TIME=$(date +%s)
	AGE_SINCE_EPOCH=$(stat --printf='%X' "$FILE")
	AGE_IN_SECONDS=$(($CUR_TIME - $AGE_SINCE_EPOCH))
	AGE_IN_MINUTES=$((AGE_IN_SECONDS / 60))
	echo $AGE_IN_MINUTES
}

# Send warning that file will expire.
# Pass remaining time as arg 1
issue_warning(){
	dunstify -r 1234 -u LOW "$FILE is about to expire." "Touch within $1 minutes, or \`$CMD\` will be executed."
}

execute_cmd(){
	dunstify -r 1234 -u LOW "$FILE expired." "Removing it and executing $CMD."
	rm $FILE
	$CMD
}

# Issue warning or execute command
time_is_up(){
	REMAINING_TIME=$(($EXPIRATION_DEADLINE - $AGE + $WARNING_PERIOD))
	if [[ $REMAINING_TIME -gt 0 ]]
	then
		issue_warning $REMAINING_TIME
	else
		execute_cmd
	fi
}

# Check if file is expired
main(){
	AGE=$(get_age "$FILE")
	if [[ $AGE -gt $EXPIRATION_DEADLINE ]]
	then
		time_is_up
	fi
}

main "$@"
