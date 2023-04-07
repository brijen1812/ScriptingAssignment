#!/bin/bash

echo "Please enter the name of Naveen's agenda file: "
read fileForNaveen

# Will get the current/today's date in YYYY-MM-DD format
current_date=$(date +%F)

# Will get the next day's date in YYYY-MM-DD format
next_date=$(date -d '+1 day' +%F)

# Here using 'grep' command to find / search for lines that contain the current or next date
# Using 'awk' command to print the fields in a table format
# Using 'column' command to format the output as a table
echo "Naveen's Meeting Agenda for $current_date and $next_date"
echo "########################################"
grep -E "$current_date|$next_date" $fileForNaveen | awk '{printf("%-20s %-10s %-10s\n", $1, $2, $3)}' | column -t
