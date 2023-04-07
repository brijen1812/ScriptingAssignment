#!/bin/bash

# List of words as an input
words=("ab" "cd" "ef")

# input string
input_string="abcdefcdefabacdbef"

# get the total length of all words in the input list
total_length=0

for word in "${words[@]}"; do
    total_length=$((total_length + ${#word}))
done

# iterate over all substrings of length equal to the total length of all words
for ((i=0; i<=${#input_string}-total_length; i++)); do
    substring="${input_string:i:total_length}"

    # split the substring into individual words
    words_in_substring=()
    for ((j=0; j<total_length; j+=${#words[0]})); do
        words_in_substring+=("${substring:j:${#words[0]}}")
    done

    # check if the set of words in the substring matches the input list of words
    if [[ "$(echo "${words_in_substring[@]}" | tr ' ' '\n' | sort)" == "$(echo "${words[@]}" | tr ' ' '\n' | sort)" ]]; then
        echo "Substring found: $substring"
    fi
done