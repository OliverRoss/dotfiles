#!/bin/bash
FILE_INSIDE_TOMB="redacted"
ICON="Crypt"
CHECK_ICON=" ✓"
FLASH_ICON=" ⚡"
if [[ $1 == "--small" ]]; then
	ICON=""
	CHECK_ICON=""
	# FLASH_ICON=""
fi

if [ -f $FILE_INSIDE_TOMB ]
then
	echo "%{F#d33682}$ICON$FLASH_ICON"
else 
	echo "%{F#859900}$ICON$CHECK_ICON"
fi
