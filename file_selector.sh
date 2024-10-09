#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# define a new function that can be called from the main menu
select_file() {

   	 # define values of new variables:
   	 height=15 # set height as number of text characters (int)
   	 width=55  # set width as number of text characters (int)
   	 dialog_title="Select a file" # set title parameter as a string for the first msgbox info dialog
   	 dialog_backtitle="Select & Delete Files" # set backtitle parameter for the first msgbox info dialog
   	 dialog_msg="Be careful when selecting a file as you have entered the file DELETE part! Any files deleted may be lost. \n\nUse the SPACE bar to navigate between folders and to select files in the file wizard." # set body text parameter as a string for the first msgbox info dialog
   	 default_file_path=`pwd`  # pwd command here allows us to set default value as current path of working directory

   	 # return a new dialog with the message box with some informative text with defined w/h parameters
   	 dialog --backtitle "$dialog_backtitle" --title "$dialog_title" --msgbox "$dialog_msg" $height $width


   	 # add a new function to hold our dialog menus for file and directory selectors
   	 show_file_wizard() {
   	 
   		 dselect_title="Choose a directory to delete:" # set title parameter for directory selector dialog
   		 dselect_backtitle="Choose a directory" # set backtitle parameter for directory selector dialog
   		 fselect_title="Use space bar & keyboard arrows to navigate and select:" # set title text parameter for file selector dialog
   		 fselect_backtitle="Choose a file"  # set backtitle text parameter for file selector dialog
   	 
   		 dirfile=$(dialog --title "$dselect_title" --backtitle "$dselect_title" --stdout --dselect $default_file_path $height $width)  # adding a new dialog stored inside selectfile variable with parameters of height and width inherited from the parent select_file function
   		 selectfile=$(dialog --title "$fselect_title" --backtitle "$fselect_backtitle" --stdout --fselect $dirfile $height $width)  # adding a new dialog stored inside selectfile variable with parameters of height and width inherited from the parent select_file function
   		 
   		 
   	 }
   	 
   		 # Lets return/run the show_file_wizard function
   		 show_file_wizard
   		 
   		 
   		 if [ -e "$selectfile" ] && [[ -f "$selectfile" ]]; then  # -e tests if file exists then return the following yes/no dialog. -f command means if the input is a file rather than a directory.
   			 dialog --yesno "You wish to delete '$selectfile' - are you sure?" 40 40  # yesno dialog with parameters, with height and width of 40. $selectfile would output the selected file name and extension.
   			 
   			 
   			 # nested conditional if statement logic testing the exit status of dialog
   			 if [ $? -eq 0 ]; then  # check exit status of dialog - if value equals 0 then return following
   				 rm "$selectfile"  # remove file command with path of file via value of selectfile variable (our dialog)
   				 dialog --msgbox "File deleted successfully" 15 40  # display a dialog message to the user saying file deleted
   			 else  # if the dialog has been exited, such as the user pressing exit, then return the following else condition
   				 dialog --msgbox "File deletion cancelled." 15 40  # a simple message box dialog displays to the user
   				 show_file_wizard  # will then return to the dialog(s) inside the show_file_wizard function - re-runs the show_file_wizard function
   			 fi  # end of nested if/else statement
   			 
   		 else  # if file does not exist then return the following
   			 dialog --msgbox "File called '$selectfile' not found. Try again..." 15 40
   		 fi
   		 
   		 
   	 source menu.sh  # get file contents of menu.sh - our main menu
   	 run_bash_menu  # use and run function from menu.sh called run_bash_menu
   	 

}  # end of function

