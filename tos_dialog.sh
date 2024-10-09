#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# Terms of Service Page
# add new function so we can wrap everything related and use it across our bash program if necessary:
tos_dialog() {

   	 # define new variables with values for the parameters of our new dialog command:
   	 TOS_TEXT="By using this program you hereby agree to abide by our terms of service. \n\n======= Privacy policy ======= \n\nAny information you enter into this program using text input boxes is at your own discretion and will only be processed by your machine and not be stored on any third party or external servers to your machine. For your own privacy and security, we advise against using this program on open public Wi-Fi networks and to take suitable steps to review and maintain your computer's security. \n\nThis software outputs the following data: \n-CPU\n-Operating system\n-Hard disk\n-Memory\n-File system\n-Event date and event name\n\n\n======= Terms of Service ======= \n\nThese terms can be amended at any time. \n\nThis project has been made for educational purposes, appropriate disclaimer and credits are included and can be found by selecting the Credits page from the menu. \n\nThis project may not be maintained but can be used for personal or business use. \n\nThe program is provided 'as is' without warranty of any kind. \n\nWe shall not be liable for any damages arising out of the use or inability to use this Unix program. \n\nIt is important that users are informed about any privacy matters that may impact them and likewise with any applicable terms of use - explicit consent such as this is required under UK law."
   	 system_msg_title="Privacy & Terms of Service:"
   	 system_msg_backtitle="Program use agreement"
   	 dialog_status="disable"
   	 height=30
   	 width=65
   	 
   	 
   	 # return dialog via dialog command with defined parameters for title, backtitle and message box body content:
   	 dialog --title "$system_msg_title" --backtitle "$system_msg_backtitle" --msgbox "$TOS_TEXT" $height $width
   	 
   	 source menu.sh  # get source file contents of our main menu file, menu.sh file
   	 local dialog_status=0  # set a local variable for the status of our dialog with value to 0
   	 run_bash_menu 0 # run the function from menu.sh called run_bash_menu with dialog status value set to 0
   	 # above function run_bash_menu returns user to main menu

}  # end of tos_dialog function
