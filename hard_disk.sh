#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# Hard Disk Information
# lets add a new function to wrap everything related to the hard disk menu inside a function so we can call the function to deploy the menu when this option is selected from the system info menu:
hard_disk() {

   	 #get/set variables about hard disk
   	 getinfo=`lsblk`  # df stands for disk free and -h means human readable format
   	 system_msg_title="Hard Disk Information"  # set title to this string text
   	 system_msg_backtitle="Hard Disk"  # set backtitle to this string text to display in background
   	 
   	 # our new dialog is the message box that will appear to the user with said parameter values as defined above:
   	 dialog --title "$system_msg_title" --backtitle "$system_msg_backtitle" --msgbox "$getinfo" 24 80
   	 # uses the dialog command with the type of "msgbox" so it can support paragraphs of text and info as output
   	 
   	 source system_info.sh  # gets source file contents from system_info.sh file
   	 local dialog_status=0  # set local variable for dialog_status variable with default of 0
   	 system_info 0  # return to the main menu with the use of this function that is defined in the system_info.sh file - the 0 will also define the default dialog_status value as 0.


}  # end of function
