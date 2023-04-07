#!/bin/bash

# To run the script ./Answer_5_Encryption.sh --algo sha512 --text "my password"
# Setting default values for below fields
password=""
algo="md5"
text=""

# Parse the arguments
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --algo)
    algo="$2"
    shift
    shift
    ;;
    --text)
    text="$2"
    shift
    shift
    ;;
    *)
    password="$1"
    shift
    ;;
esac
done

# If password entered is blank, generate a new random password
if [[ "$password" == "" ]]; then
  password=$(openssl rand -hex 16)
fi

# Encrypt the password using the specified algorithm
case $algo in
  md5)
    encrypted=$(echo -n "$password" | md5sum | awk '{print $1}')
    ;;
  sha1)
    encrypted=$(echo -n "$password" | sha1sum | awk '{print $1}')
    ;;
  sha256)
    encrypted=$(echo -n "$password" | sha256sum | awk '{print $1}')
    ;;
  sha512)
    encrypted=$(echo -n "$password" | sha512sum | awk '{print $1}')
    ;;
  base64)
    encrypted=$(echo -n "$password" | base64)
    ;;
  *)
    echo "It's an Invalid algorithm"
    exit 1
    ;;
esac

# Print the encrypted password and any requested named arguments
echo "Encrypted password: $encrypted"
if [[ "$text" != "" ]]; then
  echo "Text entered: $text"
fi
if [[ "$algo" != "" ]]; then
  echo "Algorithm name: $algo"
fi
if [[ "$length" != "" ]]; then
  echo "Length of the password: ${#password}"
fi
