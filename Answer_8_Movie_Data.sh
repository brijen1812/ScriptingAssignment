#!/bin/bash

# Prompt the user to enter the movie title
read -p "Enter movie title: " movie_title

# Download the movie data from IMDb
wget -qO- "https://imdb-api.com/en/API/SearchMovie/MY_API_KEY/$movie_title" > movie_data.json

# Parse the JSON data and extract the relevant fields
jq -r '.results[] | "\(.title) (\(.year))"' my_movie_data.json | sed 's/[^[:print:]]//g' | sed 's/ \{2,\}/ /g' | sed 's/^\s+//;s/\s+$//'

# Clean up the output and display it in a formatted table
echo -e "\n"
echo -e "Title\t\t\t\tYear"
echo -e "---------------------------------------------------"
jq -r '.results[] | "\(.title)\t\t\(.year)"' my_movie_data.json | sed 's/[^[:print:]]//g' | sed 's/ \{2,\}/\t/g' | sed 's/^\s+//;s/\s+$//' | sort -t $'\t' -k 2