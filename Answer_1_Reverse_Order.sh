#!/bin/bash

if [ $# -ne 1 ]; then
  echo "It's an error : Please provide an input as command line argument"
  exit 1
fi

myInput="$1"
reversedOutput=""
lengthOfInput=${#myInput}

for (( i=$lengthOfInput-1; i>=0; i-- ))
do
  reversedOutput="$reversedOutput${myInput:$i:1}"
done

echo "$reversedOutput" | tr ' ' '\n' | tac | xargs


