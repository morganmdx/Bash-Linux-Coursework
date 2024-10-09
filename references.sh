#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# References page
# lets wrap this inside a function so it can be called by the main menu
references_page() {

   	 # set variables
   	 getinfo=("
   	 Here are some resources we used to complete this project: \n\n
   	 - Dialog types and examples: http://linuxcommand.org/lc3_adv_dialog.php \n\n
   	 - Structure of a file selection box: https://bash.cyberciti.biz/guide/The_file_selection_box \n\n
   	 - Structure and parameters of a Linux dialog menu: http://linux.die.net/man/1/dialog \n\n
   	 - Creating a text file in command prompt: www.stackoverflow.com/questions/30756273/create-text-file-using-echo-in-command-prompt \n\n
   	 - An intro to Linux dialogs and parameters: https://www.linuxjournal.com/article/2807 \n\n
   	 - Using case logic with example: https://www.stackoverflow.com/questions/4889187/dynamic-dialog-menu-box-in-bash/ \n\n
   	 - Display date and time: https://www.cyberciti.biz/faq/linux-display-date-and-time/ \n\n
   	 - How to check os version in Linux command line: https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line
   	 ")
   	 # hyperlinks are automatically supported in the output and \n simply just returns a new line to separate the text up a bit for visual formatting reasons
   	 msg_title="References"
   	 msg_backtitle="References & Credits"
   	 height=24
   	 width=80
   	 
   	 
   	 dialog --title "$msg_title" --backtitle "$msg_backtitle" --msgbox "$getinfo" $height $width
   	 # new dialog menu using dialog command, set parameters with variable values above for title, backtitle, width and height
   	 
   	 source system_info.sh  # gets source content of file system_info.sh, allowing us to use any functions or the file contents
   	 local dialog_status=0  # set local variable value of dialog_status to 0 by default
   	 system_info 0  # use function and output content of system_info function with 0 by default for the dialog_status variable


}  # end of references_page function



