#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# we define a new function called run_bash_menu - our main menu
# we wrapped everything below related to our main bash menu into a function called run_bash_menu so it can be called rather than have a very large amount of code all inside one file
run_bash_menu() {
    source date_time.sh # get current date/time dialog menu file so we can use the function
    source calendar.sh # get events calendar dialog menu file so we can use the function
    source system_info.sh # get system info dialog menu file so we can use the function
    source tos_dialog.sh # get terms of service dialog menu file so we can use the function
    source file_selector.sh # get file selector dialog menu file so we can use the function
    source references.sh  # get references page dialog menu file so we can use the function

    # setting our variable values:
    HEIGHT=15 # set height as number of text characters
    WIDTH=45  # set width as number of text characters
    CHOICE_HEIGHT=4
    BACKTITLE="Our Bash Program" # set the following text as a string for the backtitle parameter - this will display as the title in the background/top left of the terminal window
    TITLE="Using Unix dialog command" # set the following text as a string for the title of the dialog menu
    MENU="Choose one of the following options:" # text to prompt the user to select an option
    
    # set array of options
    OPTIONS=(1 "Current Date & Time"
   	  2 "Calendar & Events"
   	  3 "System Information"
   	  4 "Terms of Service"
   	  5 "Delete File"
   	  6 "Credits, References & Disclaimer"
   	  7 "Exit")  # this is a Bash array via the variable named OPTIONS - these are key value pairs so that a numeric value can be passed as part of conditional logic to return a specific function

    CHOICE=$(dialog --clear \
   	     	--backtitle "$BACKTITLE" \
   	     	--title "$TITLE" \
   	     	--menu "$MENU" \
   	     	$HEIGHT $WIDTH $CHOICE_HEIGHT \
   	     	"${OPTIONS[@]}" \
   	     	2>&1 >/dev/tty)
   	     	# we have created a new variable called CHOICE
   	     	# we have set the type of dialog to be a menu of options to select from
   	     	# options for user to select from is specified in the bash array above using the variable OPTIONS
   	     	# dialog must have the following 3 required parameters: width, height and text string for contents of the dialog

    clear  # clears bash history from terminal including all Bash commands in terminal
    
    # case statement uses conditional logic so if a condition is met it passes any functions or statements contained within
    case $CHOICE in
   	 1)
   		 # if the first option is selected return the function called get_date_time
   		 get_date_time
   		 ;;
   		 # ;; is used to mark the end of the conditional logic sequence - this is Bash syntax
   	 2)
   		 # if the second option is selected return the function called run_calendar
   		 run_calendar
   		 ;;
   	 3)
   		 # if the third option is selected return the function called system_info
   		 system_info
   		 ;;
   	 4)
   		 # if the fourth option is selected return the function called tos_dialog
   		 tos_dialog
   		 ;;
   	 5)
   		 # if the 5th option is selected return the function called select_file
   		 select_file
   		 ;;
   	 6)
   		 # if the 6th option is selected return the function called references_page
   		 references_page
   		 ;;
   	 7)
   		 # if 7th option is selected exit the program and terminal
   		 exit
   		 ;;
   	 *)
   		 # if none of the other conditions are met we should return the user to our main menu - hence we pass the run_bash_menu function
   		 run_bash_menu
   		 ;;
    esac
    # esac stands for end of case statement logic - exits conditional logic statement
}
# end of function
