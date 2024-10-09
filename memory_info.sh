#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# Memory Information
# lets define a new function;
# wrapping everything related to memory_info into a function so it can be called on and displayed to the user when it is selected at the system menu:
memory_info() {

   	 # define our variables and their values:
   	 getinfo=`free -h`  # command for memory usage with -h parameter defined for returning in human readable format (more familiar and digestible to the end user)
   	 system_msg_title="Memory Information"  # this will be our dialog title
   	 system_msg_backtitle="File System Info"  # this will be our dialog backtitle
   	 height=24
   	 width=80
   	 
   	 # add a new dialog with the parameters being linked to the above defined values
   	 dialog --title "$system_msg_title" --backtitle "$system_msg_backtitle" --msgbox "$getinfo" $height $width
   	 
   	 source system_info.sh  # gets source file contents from system_info.sh file
   	 local dialog_status=0  # set local variable for dialog_status variable with default of 0
   	 system_info 0  # return to the main menu with the use of this function that is defined in the system_info.sh file - the 0 will also define the default dialog_status value as 0.


}  # end of function
