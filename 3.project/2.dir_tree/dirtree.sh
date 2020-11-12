#!/usr/bin/bash

# The script runtime to add to user output file
starttime=$(date "+ %Y-%m-%d %H:%M:%S")
# Two massages we want to show the user every time
mssg1=">> Enter the directory name to get in to it, "
mssg2=">> or type > this < for getting your directory tree output."

# if the user don't chose the output file name we set it to its own name
if [ -z $1 ]; then
  output=$(whoami)".txt" # if the user input was empty
else
  output=$1".txt" # set the user input name
fi

# start from root directory
cd /

while true ; do # script main loop
  # first an output of files and massages
  clear
  echo $mssg1
  echo $mssg2
  ls
  # get user input
  current=""
  echo ">> chose dir:"
  read current

  if [[ $current == "this" ]]; then
    # save the file in desktop
    cd ~
    cd Desktop
    echo $starttime > $output
    tree >> $output
    break
  else
    # go to next dir
    cd $current
  fi
done

echo "Directory output : $name"
# Done
