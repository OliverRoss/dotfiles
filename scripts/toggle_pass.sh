#!/bin/bash

if [[ -f ~/.password-store/.gpg-id ]]
then
	pass close && notify-send "Pass now closed." || notify-send "Something went wrong."
else
	pass open && notify-send "Pass now open." || notify-send "Something went wrong."
fi
