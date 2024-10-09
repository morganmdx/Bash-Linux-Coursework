#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# get source file contents of our main menu:
source menu.sh

# set our variables with string values:
TOSBACKTITLE="Service agreement"
TOSTITLE="Terms of Service"
TOSTITLE_NO="Your response to our Terms of Service"
TOS_MSG_NO="\nYou need to first accept the program's Terms of Service. Taking you back to the Terms of Service dialog menu..."
TOS_TEXT="Do you agree to both our Privacy Policy and Terms of Service? \n\nBy selecting Yes you agree to our Terms & privacy policy. \n\nBy selecting No you do NOT agree to our TOS & privacy policy. \n\nBy using this program you hereby agree to abide by our terms of service. \n\n======= Privacy policy ======= \n\nAny information you enter into this program using text input boxes is at your own discretion and will only be processed by your machine and not be stored on any third party or external servers to your machine. For your own privacy and security, we advise against using this program on open public Wi-Fi networks and to take suitable steps to review and maintain your computer's security. \n\nThis software outputs the following data: \n-CPU\n-Operating system\n-Hard disk\n-Memory\n-File system\n-Event date and event name\n\n\n======= Terms of Service ======= \n\nThese terms can be amended at any time. \n\nThis project has been made for educational purposes, appropriate disclaimer and credits are included and can be found by selecting the Credits page from the menu. \n\nThis project may not be maintained but can be used for personal or business use. \n\nThe program is provided 'as is' without warranty of any kind. \n\nWe shall not be liable for any damages arising out of the use or inability to use this Unix program. \n\nIt is important that users are informed about any privacy matters that may impact them and likewise with any applicable terms of use - explicit consent such as this is required under UK law."

# add a new function so the terms of service banner can potentially be called over and over if needed, or maybe from separate files; this allows the function to be re-used across the Bash program if necessary.
terms_service_banner() {

    # define new variables with values for the parameters of our new dialog command
    tos_serv_height=24
    tos_serv_width=40
    # returns a yesno dialog with the title parameters, a set height and width and saves the exit status to a new variable
    dialog --backtitle "$TOSBACKTITLE" --title "$TOSTITLE" --yesno "$TOS_TEXT" $tos_serv_height $tos_serv_width
    dialog_status=$?  # $? returns the exit status of the last executed dialog command
}  # end of function

terms_service_banner  # returns function called terms_service_banner meaning it returns the yes/no TOS agree dialog

# add a new function so we add everything that is related to the TOS rejected banner inside this new function
terms_reject_banner() {
    # return dialog via dialog command with defined parameters for title, backtitle and message box body content
    # set our parameters for the dialog menu:
    reject_height=7
    reject_width=60
    dialog --backtitle "$TOSBACKTITLE" --title "$TOSTITLE_NO" --msgbox "$TOS_MSG_NO" $reject_height $reject_width
}  # end of function

while [ "$dialog_status" -eq 1 ]; do  # while the dialog exit status is equal to 1 do the following.
    terms_reject_banner
    if [ "$dialog_status" -eq 1 ]; then  # if exit status of dialog is equal to 1 then return the function below
   	 terms_service_banner
    else  # if not true then return the main menu
   	 run_bash_menu  # takes user back to main menu
    fi  # end of if conditional logic statement

done  # end of while condition loop
run_bash_menu # call the run_bash_menu into effect, runs this function and returns user to main menu
