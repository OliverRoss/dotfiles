#!/bin/bash

print_help(){
	echo "usage: ./checkin.sh option"
	echo "options:"
	echo "    --checkin: Check in right now"
	echo "    --test: Test if checked in"
}

notify(){
	MSG_STRING="Not checked in yet!"
	if [ -f /tmp/checkin ]
	then
		ID=$(cat /tmp/checkin | tail -n 1)
		/usr/local/bin/dunstify -r "${ID}" -u critical "${MSG_STRING}"
	else
		/usr/local/bin/dunstify -p -u critical "${MSG_STRING}" > /tmp/checkin_id
	fi
}

test_checkin(){
	# How often a checkin needs to happen
	checkin_period_hours=8
	checkin_period_minutes=0
	checkin_period=$((60 * 60 * "${checkin_period_hours}" + 60 * "${checkin_period_minutes}"))

	if ! [ -f /tmp/checkin ]
	then
		notify
		exit 1 
	fi

	last_checkin=$(cat /tmp/checkin | tail -n 1 )
	if [ $? -ne 0 ]
	then 
		notify-send -u critical "Invalid date format in /tmp/checkin. Use
		\`date +%s >> /tmp/checkin\`"
	fi

	now=$(date -d "now" +%s)

	since_last_checkin=$(("${now}" - "${last_checkin}"))

	if [ "${since_last_checkin}" -gt "${checkin_period}" ]
	then
		notify
	fi
}

do_checkin(){
	touch /tmp/checkin	
	date +%s >> /tmp/checkin
	test_checkin
	if [ $? -eq 0 ]
	then
		/usr/local/bin/dunstctl close
	else
		echo "Could not check in."
		exit 1
	fi
}

checkin_routine(){
	clear
	echo "Successfully checked in."
	task
}

main(){
	case "$1" in
	"--test")
		test_checkin
		;;
	"--checkin")
		do_checkin
		checkin_routine
		;;
	*)
		notify-send "checkin.sh called with invalid args."
		print_help
		;;
	esac
}

# main "$@"
