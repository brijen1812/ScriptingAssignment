#!/bin/bash

echo "Please enter the name of the file: "
read myFile

# Comments
# First 'tr' is used to convert all of the characters from the file to lowercase and replace punctuation with white spaces
# Second 'tr' is used again to convert multiple white spaces to single white spaces
# Here 'awk' is used to count the frequency of each word and print it with the word
# Here 'sort' command is used to arrange/sort the output frequency in descending order
# At last 'awk' command is used again to print only the word and it's frequency without the filename and line number
cat $myFile | tr '[:upper:]' '[:lower:]' | tr -s '[:punct:]' ' ' | awk '{for(i=1;i<=NF;i++) {count[$i]++}} END {for(i in count) {print count[i], i}}' | sort -nr | awk '{print $2, $1}'


