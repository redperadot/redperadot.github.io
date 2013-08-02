#!/bin/sh

#  reset_favicon.sh
#  
#  Created by Cody Hannafon on 6/24/13.
#
#  v1.3

clear
OS=$(sw_vers -productVersion)
if [[ $OS == 'sw_vers: command not found' ]]; then
    OS='Linux'
fi
if [[ $OS == 10.5* || $OS == 10.6* || $OS == 10.7* || $OS == 10.8* || $OS == 10.9* ]]; then
	shopt -s nocasematch
	
	echo "Which favicon cache would you like to clear"
	echo "[For all caches enter    '0' or 'All'   ]"
	echo "[For Safari's cache enter '1' or 'Safari']"
	echo "[For Chrome's cache enter '2' or 'Chrome']"
	echo "[default '0']: \c"
	read CHOICE
	if [[ $CHOICE == '' ]]; then
	    CHOICE=0
	fi
	
	if [[ $CHOICE == '0' || $CHOICE == 'all' ]]; then
		echo "This will reset all caches and restart all web browsers. Continue? [default 'Yes']: \c"
		read START
		if [[ $START == '' ]]; then
		    START=yes
		fi
		
		if [[ $START == 'yes' || $START == 'y' ]]; then
			echo 'Clearing all favicon caches\r\c'
			sleep .5
			echo 'Clearing all favicon caches.\r\c'
			sleep .5
			echo 'Clearing all favicon caches..\r\c'
			sleep .5
			echo 'Clearing all favicon caches...\r\c'
			rm ~/Library/Safari/WebpageIcons.db
			rm ~/Library/Application Support/Google/Favicons
	    	echo '\n\c'
	    	echo 'Done!'
			echo 'Restarting Safari\r\c'
			sleep .5
			echo 'Restarting Safari.\r\c'
			sleep .5
			echo 'Restarting Safari..\r\c'
			sleep .5
			pkill Safari
			echo 'Restarting Safari..\r\c'
			open -a Safari
	    	echo '\n\c'
	    	echo 'Done!'
			echo 'Restarting Chrome\r\c'
			sleep .5
			echo 'Restarting Chrome.\r\c'
			sleep .5
			echo 'Restarting Chrome..\r\c'
			sleep .5
			pkill Google\ Chrome
			echo 'Restarting Chrome..\r\c'
			open -a /Applications/Google\ Chrome.app/
	    	echo '\n\c'
	    	echo 'Done!'
		elif [[ $START == 'no' || $START == 'n' ]]; then
		    clear
		    echo "$(tput setaf 2)exited with status code 0 [Success] $(tput sgr0)"
		    exit 0
		else
		    clear
		    echo "You did not choose either 'Yes' or 'No'..."
		    echo "$(tput setaf 1)exited with status code 2 [Incorrect usage] $(tput sgr0)"
		    exit 2
		fi
	fi
	
	if [[ $CHOICE == '1' || $CHOICE == 'safari' ]]; then
		echo "Reset Safari's favicon cache and restart browser? [default 'Yes']: \c"
		read START
		if [[ $START == '' ]]; then
		    START=yes
		fi
		
		if [[ $START == 'yes' ]]; then
			echo "Clearing Safari's favicon cache\r\c"
			sleep .5
			echo "Clearing Safari's favicon cache.\r\c"
			sleep .5
			echo "Clearing Safari's favicon cache..\r\c"
			sleep .5
			echo "Clearing Safari's favicon cache...\r\c"
			rm ~/Library/Safari/WebpageIcons.db
	    	echo '\n\c'
	    	echo 'Done!'
			echo 'Restarting Safari\r\c'
			sleep .5
			echo 'Restarting Safari.\r\c'
			sleep .5
			echo 'Restarting Safari..\r\c'
			sleep .5
			pkill Safari
			echo 'Restarting Safari...\r\c'
			open -a Safari
	    	echo '\n\c'
	    	echo 'Done!'
			sleep .5
		elif [[ $START == 'no' ]]; then
		    clear
		    echo "$(tput setaf 2)exited with status code 0 [Success] $(tput sgr0)"
		    exit 0
		else
		    clear
		    echo "You did not choose either 'Yes' or 'No'..."
		    echo "$(tput setaf 1)exited with status code 2 [Incorrect usage] $(tput sgr0)"
		    exit 2
		fi
	fi
	
	if [[ $CHOICE == '2' || $CHOICE == 'chrome' ]]; then
		echo "Reset Chrome's favicon cache and restart browser? [default 'Yes']: \c"
		read START
		if [[ $START == '' ]]; then
		    START=yes
		fi
		
		if [[ $START == 'yes' ]]; then
			echo "Clearing Chrome's favicon cache\r\c"
			sleep .5
			echo "Clearing Chrome's favicon cache.\r\c"
			sleep .5
			echo "Clearing Chrome's favicon cache..\r\c"
			sleep .5
			echo "Clearing Chrome's favicon cache...\r\c"
			rm ~/Library/Application\ Support/Google/Chrome/Default/Favicons
	    	echo '\n\c'
	    	echo 'Done!'
			echo 'Restarting Chrome\r\c'
			sleep .5
			echo 'Restarting Chrome.\r\c'
			sleep .5
			echo 'Restarting Chrome..\r\c'
			sleep .5
			pkill Google\ Chrome
			echo 'Restarting Chrome...\r\c'
			open -a /Applications/Google\ Chrome.app/
	    	echo '\n\c'
	    	echo 'Done!'
			sleep .5
		elif [[ $START == 'no' ]]; then
		    clear
		    echo "$(tput setaf 2)exited with status code 0 [Success] $(tput sgr0)"
		    exit 0
		else
		    clear
		    echo "You did not choose either 'Yes' or 'No'..."
		    echo "$(tput setaf 1)exited with status code 2 [Incorrect usage] $(tput sgr0)"
		    exit 2
		fi
	fi
	
	shopt -u nocasematch
	clear
	
	if [[ $CHOICE == '0' || $CHOICE == 'all' || $CHOICE == '1' || $CHOICE == 'safari' || $CHOICE == '2' || $CHOICE == 'chrome' ]]; then
		echo "$(tput setaf 2)exited with status code 0 [Success] $(tput sgr0)"
		exit 0
	else
	    echo "You did not choose either '0' '1' or '2'..."
	    echo "$(tput setaf 1)exited with status code 2 [Incorrect usage] $(tput sgr0)"
	    exit 2
	fi
else
	clear
	echo "Sorry but this script requires OS X version 10.5 - 10.9 not $OS..."
	echo "$(tput setaf 1)exit status 2 [error] $(tput sgr0)"
	exit 2
fi

# EOF #