#!/bin/bash
# usage: ./start_browser.sh [URL]

# | -------- Config 


# Files should contain csv-data in this format:
# Title,URL
# Location of bookmark files
BASEDIR='$HOME/.dotfiles/bookmarks'
# Name of archive folder within BASEDIR
ARCHIVEDIR="archive"

# Which browser to use
BROWSER=firefox
BROWSER_OPTIONS=""

# Text that will be used to select the URL/search entry in rofi
URL_BUTTON="爵 url"
SEARCH_BUTTON=" search"
WEBSITE_BUTTON="裡 website"
ARCHIVE_BUTTON=" $ARCHIVEDIR"

# Text for the first prompt
PROMPT=" "

# | -------- Script

# Global placeholder
URL=""

# Dependencies
deps=(rofi fd i3-msg xdotool)

check_deps(){
	for dep in ${deps[@]}; do
		command -v $dep &>/dev/null || { notify-send "$0: $dep not found."; failure=1; }
	done
	[[ $failure -eq 1 ]] && exit 1
}

get_bookmark(){
	# Go to base dir
	cd $BASEDIR
	# Get all files + archive folder + URL + search
	categories=$(fd --strip-cwd-prefix -t f --max-depth 1 | paste; echo "$URL_BUTTON"; echo "$SEARCH_BUTTON"; echo " $ARCHIVEDIR")
	category=$(printf "${categories}" | rofi -dmenu -i -p "$PROMPT")
	if [[ $category == "$ARCHIVE_BUTTON" ]]; then
		# Go to archive dir
		cd $ARCHIVEDIR 
		# Get all files within archive dir
		categories=$(fd --strip-cwd-prefix -t f --max-depth 1 | paste)
		category=$(printf "${categories}" | rofi -dmenu -i -p "$ARCHIVE_BUTTON")
	fi
	if [[ $category == "$URL_BUTTON" ]]; then
		# Prompt for URL
		URL=$(rofi -dmenu -i -p "$URL_BUTTON")
		return
	fi
	if [[ $category == "$SEARCH_BUTTON" ]]; then
		# Let user enter search term
		if [[ $BROWSER == "firefox" ]]; then
			BROWSER_OPTIONS="$BROWSER_OPTIONS --search "
		fi
		URL=$(rofi -dmenu -i -p "$SEARCH_BUTTON")
		return
	fi
	# Get tags: First fields of the selected csv file
	[[ $category != "" ]] && tag=$(cat $category | cut -d, -f1 | rofi -dmenu -i -p "$WEBSITE_BUTTON")
	# Get corresponding URL: Second field of csv file
	[[ "$tag" != "" ]] && URL=$(cat $category | grep "$tag" | cut -d, -f2)
}

get_active_workspace(){
	i3-msg -t get_workspaces | jq | ag -B2 'focused": true' | ag name | sed 's/^.*": "\(.*\)",/\1/g'
}

# get_active_window_classname(){
#         xdotool getwindowclassname $(xdotool getactivewindow)
# }

switch_to_browser(){
	# If browser is not active window, first go there
	pgrep -f $BROWSER
	if [[ $? -eq 0 ]]; then
		if [[ $(get_active_workspace) != "6:web" ]]; then
			i3-msg workspace 6:web
			exit 0
		fi
	fi
}

main(){
	check_deps
	switch_to_browser &> /dev/null
	get_bookmark
	[[ "$URL" != "" ]] || exit 1
	$BROWSER ${BROWSER_OPTIONS} "$URL"
}

main 
