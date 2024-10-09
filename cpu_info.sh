#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# Computer CPU Information
# Add a new function:
# everything related to cpu info should be wrapped inside this function
# wrapping code inside a function allows it to be reused across our bash program and called via this function
cpu_info() {

   	 # Define new variables..
   	 # then define values of new variables:
   	 getinfo=`lscpu`  # display detailed info about the local machine's operating system, e.g. manufacturer, num of sockets, number of CPUs etc
   	 system_msg_title="Computer CPU Information:"  # set title for dialog
   	 system_msg_backtitle="CPU Info"  # set backtitle for dialog background
   	 height=30  # set value of height to 30
   	 width=65  # set value of width to 65
   	 
   	 # add a new dialog with the parameters being linked to the above defined values
   	 dialog --title "$system_msg_title" --backtitle "$system_msg_backtitle" --msgbox "$getinfo" $height $width
   	 
   	 source system_info.sh  # gets source file contents of our system info menu
   	 local dialog_status=0   # set local variable value of dialog_status to 0 by default
   	 system_info 0  # return to the system info menu with the use of this function that is defined in the system_info.sh file - the 0 will also define the default dialog_status value as 0.


}  # end of function
