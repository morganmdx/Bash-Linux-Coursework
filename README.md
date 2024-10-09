# Bash System Information and Calendar Program

This program is written in Bash for the Linux operating system and can be launched via Oracle VirtualBox using a suitable Linux ISO operating system image. The program displays hardware and OS information, allows users to manage a calendar with events, provides a file selection tool for deleting files, and shows the current date and time.

## Features

- **System Information:**
  - Operating system type
  - CPU details
  - Memory information
  - Hard disk details
  - File system mounted details

- **Calendar & Events:**
  - View calendar
  - Add events to the calendar

- **File Management:**
  - Select and delete files

- **Utility:**
  - Displays current date and time
  - Terms of Service page
  - Credits and references page

## Dependencies

To run the program, ensure the following dependencies are installed on your system:

1. **dialog**  
   Install via:
   ```bash
   sudo apt-get update
   sudo apt-get install dialog

2. **Desktop Notifications for Calendar feature**
   sudo apt-get install libnotify-bin

## Installation
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

## Run the program
chmod +x program.sh
./program.sh

## File Structure
1. **Main Program:**
program.sh - Entry point script

2. **Menus & Utilities:**
menu.sh - Main menu
date_time.sh - Shows current date and time
calendar.sh - Manages calendar and events
system_info.sh - Displays system information
operating_system.sh - Displays OS type
cpu_info.sh - Displays CPU info
memory_info.sh - Displays memory info
hard_disk.sh - Displays hard disk info
file_system.sh - Displays mounted file system
file_selector.sh - File selection and deletion
tos_dialog.sh - Displays Terms of Service
references.sh - Shows credits and references

## Testing

Last tested: 02:21 22/01/2024
Operating system: Ubuntu 22.04.3 LTS, 64-bit

## License

This project is currently licensed under the MIT License. This is subject to change.
See the LICENSE file for more details.

## Tech Stack

![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnu-bash&logoColor=white&style=flat-square)
![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black&style=flat-square)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?logo=ubuntu&logoColor=white&style=flat-square)
![Oracle VirtualBox](https://img.shields.io/badge/VirtualBox-183A61?logo=virtualbox&logoColor=white&style=flat-square)
