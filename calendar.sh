#!/bin/bash
# the above line specifies which bash interpreter and path should be used - used to execute the script

# while-menu-dialog: a menu driven system information program
# define a new variable called calendarevents - this will be used to set the file name

run_calendar() {
   	 
   	 # we define a new variable for where our new entries should be saved to - or if this file exists it is used to output into - it is a .txt file
   	 calendarevents="calendar.txt"


   	 show_entries() {
   		 # wrap in function so it can be called at a suitable time and use dialog command to display a good looking Unix UI menu
   		 dialog --backtitle "Availability & Calendar" --title "Events List" --textbox "$calendarevents" 14 50
   	 }


   	 # lets create another function called get_event
   	 # this function will handle the creation of any new events including date, event name and error handling
   	 get_event(){

   	 # we define a new variable called todaysdate
   	 # this variable takes the date from local machine/OS and outputs in the D M Y format hence % sign for formatting
   	 todaysdate=date +"%d %m %y"

   		 # while loop runs as an infinite loop and will run for as long as the condition true remains true
   		 # in this case the following while loop will run until we use a 'break' statement to break out of our infinite while loop
   		 while true; do
   			 # the dialog menu supports the following parameters: title, backtitle (top/background title of the window within the command terminal), type of dialog (e.g. calendar) and frame size, among others
   			 # $todaysdate we have defined using the date parameter set by the local machine and output in the format we specified in the $todaysdate variable above
   			 # stdout is a command which sends information back to the terminal as output
   			 date=$(dialog --title "Select a date:" --backtitle "Create a new event" --stdout --calendar ''  4 50 $todaysdate)
   			 if [ -z "$date" ]; then  # the -z stands for 'if' length of the date variable is 0 (e.g. empty) then the following message box dialog should appear
   				 dialog --msgbox "The event date is a required field - the event has not yet been created!" 0 0
   				 return
   			 fi

   			 event=$(dialog --backtitle "Create a new event - final step" --title "Event name" --stdout --inputbox "Enter an event name for $date: " 0 0) # add new dialog menu that will ask user for input on a separate screen subsequent to the last step - the terminal will execute the code in order from top to bottom
   			 
   			 if dialog --yesno 'Reminder?' 0 0; then   # if dialog answer = yes then return system notification
   				 notify-send "Reminder about $event" "Here is a reminder about your event $event on $date." -u critical  # use the notify-send command to send a system notification with a critical status, with details such as event name and event date as fields
   			 fi  # end of conditional if statement
   			 
   			 
   			 if [ -n "$event" ]; then  # if value of $event variable dialog is not empty then return the following
   				 break  # break out of loop if logic conditional
   			 else  # if the above condition is not true then run the following
   				 dialog --msgbox "The event name is a required field - the event has not yet been created!" 0 0  # display the following dialog type - message box, allows us to provide information to the user about where they are going wrong
   				 return
   			 fi  # end of if statement
   			 
   				 
   			 
   		 dialog --msgbox "Event added for $date - $event"
   		 done  # end of while true loop
   	 }  # end of function


   	 while true; do   # while true state run this, if false then will abort

   		 show_entries  # run this function - displays existing entries, showing content of calendar.txt file
   		 get_event  # run this function - display dialog menus for creating an event
   		 
   		 if [ ! -z "$date" ] && [ -n "$event" ]; then  # if both the event date and name has been set then the following echo statement should output to the new txt file
   		 # -n and -z stands for empty
   		 # && stands for "AND"
   			 echo "$date: $event" >> "$calendarevents"  # print output via echo statement as string to the .txt file
   		 fi  # end of conditional if statement
   		 
   		 dialog --msgbox "Event added for $date - $event"
   		 
   		 
   		 
   	 source menu.sh  # gets source contents of menu.sh file and allows us to use any code or functions
   	 run_bash_menu  # run the function from menu.sh called run_bash_menu
   	 
   	 done  # end of while true loop

}  # end of function
