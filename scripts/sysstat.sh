#!/bin/bash

source ~/.dotfiles/scripts/solarized.sh

COL_STOP="%{F-}"
SEP="  "

AUR_FILE=/tmp/aur_updates
PACMAN_FILE=/tmp/pacman_updates

main(){
	SWAP=$(free -m | grep Swap | awk '{printf "%d", ($3/$2)*100}' )
	MEM=$(free -m | grep Mem | awk '{printf "%d", (100-($7/$2)*100)}' )
	TEMP=$(sensors | grep 'id 0' | cut -d ' ' -f 5 | tr -d + | grep -o '^..')
	# Apperantly jobs named "kidle" get spawned to cool the CPU by
	# busy-waiting
	KIDLE=$(top -b -n 1 | grep -q kidle && echo "⚡")
	CPU=$(top -b -n 2 -p 1 | grep 'Cpu(s)' | tail -1 | awk '{print $8}' | cut -f1 -d. | sed 's/^/100- /g' | bc | cut -d. -f1)
	HOME_LINE=$(df -h | grep 'MyVolGroup-home' )
	HOME_USED=$(echo $HOME_LINE | cut -d' ' -f3 | tr -d G )
	HOME_SIZE=$(echo $HOME_LINE | cut -d' ' -f2 | tr -d G)
	HOME=$(df | grep 'MyVolGroup-home' | grep -o '[0-9]\+%' | tr -d % )
	ROOT=$(df | grep 'MyVolGroup-root' | grep -o '[0-9]\+%' | tr -d % )
	# This is read from a /tmp - File, make sure to populate it
	PACMAN=$(cat $PACMAN_FILE 2>/dev/null)

	# Set colors depending on load
	CPU_COL=%{F$SOL_BASE0}
	MEM_COL=%{F$SOL_BASE0}
	TEMP_COL=%{F$SOL_BASE0}
	SWAP_COL=%{F$SOL_BASE0}
	HOME_COL=%{F$SOL_BASE0}
	ROOT_COL=%{F$SOL_BASE0}
	PACMAN_COL="%{F$SOL_BASE0}"

	[[ $SWAP -ge 10 ]] && SWAP_COL="%{F$SOL_ORANGE}"
	[[ $MEM -ge 50 ]] && MEM_COL="%{F$SOL_ORANGE}"
	[[ $MEM -ge 80 ]] && MEM_COL="%{F$SOL_MAGENTA}"
	[[ $CPU -ge 40 ]] && CPU_COL="%{F$SOL_GREEN}"
	[[ $CPU -ge 60 ]] && CPU_COL="%{F$SOL_ORANGE}"
	[[ $CPU -ge 80 ]] && CPU_COL="%{F$SOL_MAGENTA}"
	[[ $TEMP -ge 70 ]] && TEMP_COL="%{F$SOL_GREEN}"
	[[ $TEMP -ge 75 ]] && TEMP_COL="%{F$SOL_ORANGE}"
	[[ $TEMP -ge 80 ]] && TEMP_COL="%{F$SOL_MAGENTA}"
	[[ $ROOT -ge 80 ]] && ROOT_COL="%{F$SOL_ORANGE}"
	[[ $ROOT -ge 90 ]] && ROOT_COL="%{F$SOL_MAGENTA}"
	[[ $HOME -ge 60 ]] && HOME_COL="%{F$SOL_ORANGE}"
	[[ $HOME -ge 80 ]] && HOME_COL="%{F$SOL_MAGENTA}"
	[[ "$PACMAN" -ne 0 ]] && PACMAN_COL="%{F$SOL_ORANGE}"

	if ! [[ -f $PACMAN_FILE ]]; then
		PACMAN=⚡
		PACMAN_COL="%{F$SOL_MAGENTA}"
	fi

	# Less verbose: 
	SWAP_OUTPUT="${SWAP_COL}易 $SWAP${COL_STOP}"
	MEM_OUTPUT="${MEM_COL} $MEM${COL_STOP}"
	CPU_OUTPUT="${CPU_COL} $CPU${COL_STOP}"
	TEMP_OUTPUT="${TEMP_COL} $TEMP${KIDLE}${COL_STOP}"
	ROOT_OUTPUT="${ROOT_COL} $ROOT${COL_STOP}"
	HOME_OUTPUT="${HOME_COL} $HOME${COL_STOP}"

	# More verbose:
	# SWAP_OUTPUT="${SWAP_COL}易 $SWAP%${COL_STOP}"
	# MEM_OUTPUT="${MEM_COL} $MEM%${COL_STOP}"
	# CPU_OUTPUT="${CPU_COL} $CPU%${COL_STOP}"
	# TEMP_OUTPUT="${TEMP_COL} $TEMP°C ${KIDLE}${COL_STOP}"
	# ROOT_OUTPUT="${ROOT_COL} $ROOT%${COL_STOP}"
	# HOME_OUTPUT="${HOME_COL} $HOME_USED/${HOME_SIZE}G${COL_STOP}"

	PACMAN_OUTPUT="${PACMAN_COL}ﰵ $PACMAN${COL_STOP}"

	echo "${PACMAN_OUTPUT}${SEP}\
		${ROOT_OUTPUT}${SEP}\
		${HOME_OUTPUT}${SEP}\
		${MEM_OUTPUT}${SEP}\
		${SWAP_OUTPUT}${SEP}\
		${CPU_OUTPUT}${SEP}\
		${TEMP_OUTPUT}"
}

while [[ 1 -eq 1 ]]
do
	main || notify-send "sysstat.sh: Something went wrong"
done
