#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# Define a new function that can be called from the main menu for date/time:
get_date_time() {

    DATE=`date`  # use the date of the operating system/local machine via a new variable called DATE
    
    dialog --backtitle "Current date and time" --title "Date:Time" --msgbox "$DATE" 0 0
    
    source menu.sh  # gets source file contents from menu.sh file - main menu
    local dialog_status=0  # define a new local variable with the value of 0 for the dialog status
    run_bash_menu 0  # returns user to main menu by calling this function with a default dialog status value state of 0

}  # end of function
