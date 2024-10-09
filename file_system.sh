#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# lets add a new function to wrap everything related to the file system menu inside a function so we can call the function to deploy the menu when this option is selected from the system info menu:
file_system() {

   	 # Get/set variables about hard disk:
   	 width=80  # set width of dialog
   	 height=24  # set height of dialog
   	 getinfo=`mount`  # displays file system mounted
   	 system_msg_title="File System (Mounted)"  # set title to this string text
   	 system_msg_backtitle="File System Info"  # set backtitle to this string text to display in background
   	 
   	 # our new dialog is the message box that will appear to the user with said parameter values as defined above:
   	 dialog --title "$system_msg_title" --backtitle "$system_msg_backtitle" --msgbox "$getinfo" $height $width
   	 
   	 source system_info.sh  # gets source file contents of our system info menu
   	 local dialog_status=0  # set local variable value of dialog_status to 0 by default
   	 system_info 0  # return to the system info menu with the use of this function that is defined in the system_info.sh file - the 0 will also define the default dialog_status value as 0.


}  # end of file_system function
