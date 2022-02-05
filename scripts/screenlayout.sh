#!/bin/bash

laptop_vga(){
	xrandr --output LVDS-1 --mode 1366x768 --pos 0x256 --rotate normal --brightness 1.0 --output VGA-1 --primary --mode 1280x1024 --pos 1366x0 --rotate normal --output HDMI-1 --off --output DP-1 --off
}

vga(){
	xrandr --output LVDS-1 --off --output VGA-1 --primary --mode 1280x1024 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off
}

hdmi(){
	xrandr --output LVDS-1 --off --output VGA-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off
}

laptop(){
	xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x256 --rotate normal --brightness 1.0 --output VGA-1 --off --output HDMI-1 --off --output DP-1 --off
}

laptop_hdmi(){
	xrandr --output LVDS-1 --mode 1366x768 --pos 0x0 --rotate normal --brightness 1.0 --output VGA-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal --output DP-1 --off
}

case $1 in 
	laptop_vga)
		laptop_vga
		;;
	laptop_hdmi)
		laptop_hdmi
		;;
	vga)
		vga
		;;
	laptop)
		laptop
		;;
	hdmi)
		hdmi
		;;
	*)
		echo "Not valid arg."
		exit 1
		;;
esac

~/.dotfiles/scripts/launch_polybars.sh
