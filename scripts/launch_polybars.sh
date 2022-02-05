#!/bin/bash

# Kill existing polybars
killall -q polybar
while pgrep -x polybar >/dev/null
do
	sleep 1
done

if [[ "$1" == "kill" ]]; then
	exit 0
fi

# On HDMI output: use bigger layout
polybar --list-monitors | grep "HDMI-1" 
if [[ $? -eq 0 ]]
then
	polybar top_big&
	polybar bottom_big&
else
	polybar top_s&
	polybar bottom_s&
fi

exit 0
