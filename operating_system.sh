#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# Operating system Information
# lets define a new function called os_info
# we have wrapped everything related to the operating system info into this new function
# when the below information is needed, it will be displayed to the user by the function os_info being called
os_info() {

    # define our variables and their values:
    getinfo=`lsb_release -d -s`  # displays description of OS version
    fulllsb=`lsb_release -a`  # print more detailed information to the user about the OS
    ostwo=`uname -a`  # hence the -a parameter, prints ALL info about the system such as the machine name and operating system (e.g. Linux)
    system_msg_title="Operating System Information:"
    system_msg_backtitle="OS Info"
    height=20
    width=65
   	 
    # add a new dialog with the parameters being linkeds to the above defined values    
    dialog --title "$system_msg_title" --backtitle "$system_msg_backtitle" --msgbox "\nYou are using $getinfo. \n\n$fulllsb \n\n$ostwo" $height $width
   	 
    source system_info.sh  # gets source file contents from system_info.sh file
    local dialog_status=0  # set local variable for dialog_status variable with default of 0
    system_info 0  # return to the main menu with the use of this function that is defined in the system_info.sh file - the 0 will also define the default dialog_status value as 0.

}  # end of function
