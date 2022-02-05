#!/bin/bash

# Get solarized colors
source ~/.dotfiles/scripts/solarized.sh

VPN="VPN"
CHECK_ICON=" ✓"
if [[ $1 == "--small" ]]; then
	VPN=""
	CHECK_ICON=""
fi

STATUS_SYMBOL=""
COLOR=""
STATUS=$(mullvad status 2>/dev/null)

# Fallback
COLOR=$SOL_MAGENTA; STATUS_SYMBOL="?"
echo $STATUS | grep -q Connecting	&& COLOR=$SOL_YELLOW STATUS_SYMBOL=" …" 
echo $STATUS | grep -q Connected	&& COLOR=$SOL_GREEN STATUS_SYMBOL="$CHECK_ICON" 
echo $STATUS | grep -q Disconnected	&& COLOR=$SOL_MAGENTA STATUS_SYMBOL=" ⚡" 
echo $STATUS | grep -q buy		&& COLOR=$SOL_RED STATUS_SYMBOL=" €" 

echo "%{F$COLOR}$VPN$STATUS_SYMBOL"
