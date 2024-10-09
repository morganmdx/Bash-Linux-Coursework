#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

system_info() {

    # return source file contents, allows us to use any functions within these files:
    source bash-menu.sh  # returns file contents of our main menu
    source cpu_info.sh  # returns source file contents of our cpu info dialog
    source memory_info.sh  # returns source file contents of our memory info dialog
    source file_system.sh  # returns source file contents of our file system dialog
    source operating_system.sh  # returns source file contents of our OS info
    source hard_disk.sh  # returns info on our hard disk drive

    # setting our variable values:
    HEIGHT=15  # set height as number of text characters
    WIDTH=40  # set width as number of text characters
    CHOICE_HEIGHT=4
    BACKTITLE="OS, Memory, CPU and File System"  # set the following text as a string for the backtitle parameter - this will display as the title in the background/top left of the terminal window
    TITLE="Information about your system"  # set the following text as a string for the title of the dialog menu
    MENU="Choose one of the following options:"  # text to prompt the user to select an option

    # set array of options:
    OPTIONS=(1 "Operating System Type"
   	  2 "Computer CPU Information"
   	  3 "Memory Information"
   	  4 "Hard Disk Information"
   	  5 "File System (Mounted)")
   	  # this is a Bash array via the variable named OPTIONS - these are key value pairs so that a numeric value can be passed as part of conditional logic to return a specific function

    # display dialog to user with parameters and of a menu type, allowing the user to select only one option:
    CHOICE=$(dialog --clear \
   	     	--backtitle "$BACKTITLE" \
   	     	--title "$TITLE" \
   	     	--menu "$MENU" \
   	     	$HEIGHT $WIDTH $CHOICE_HEIGHT \
   	     	"${OPTIONS[@]}" \
   	     	2>&1 >/dev/tty)
   	     	# 2>&1 redirects output to same place
   	     	# OPTIONS uses variable values defined in the array above

    source menu.sh  # gets source file contents of menu.sh - our main menu file
    
    clear    # clears bash history from terminal including all Bash commands in terminal
    
    # case statement uses conditional logic so if a condition is met it passes any functions or statements contained within
    case $CHOICE in
   	 # if the 1st option is selected return the function os_info:
   	 1)
   		 os_info
   			 ;;
   	 # if the 2nd option is selected return the function cpu_info:
   	 2)
   			 cpu_info
   			 ;;
   	 # if the 3rd option is selected return the function memory_info:
   	 3)
   		 memory_info
   		 ;;
   	 # if the 4th option is selected return the function hard_disk:
   	 4)
   		 hard_disk
   		 ;;   	 
   	 # if the 5th option is selected return the function file_system:
   	 5)
   			 file_system
   	 	;;
   	 # if none of the other conditions are met we should return the user to our main menu - hence we pass the run_bash_menu function
   	 *)
   		 run_bash_menu
   		 ;;
    
    esac  # esac stands for end of case statement logic - exits conditional logic statement

}  # end of system_info function
