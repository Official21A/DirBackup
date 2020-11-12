#!/usr/bin/bash

starttime=$(date "+ %Y-%m-%d %H:%M:%S")
mssg=":> type the directory name to get in to it, or type > this < for getting your directory tree output."

if [ -z $1 ]; then
  name="home/"$(whoami) # if the user input was empty
  output=$(whoami)".txt"
else
  name=$1 # set the user input name
  output=$1".txt"
fi

cd /

while true ; do
  clear
  echo $mssg
  ls -a
  current=""
  echo ">> chose dir:"
  read current
  if [[ $current == "this" ]];then
    cd ~
    cd Desktop
    echo $starttime > $output
    tree >> $output
    break
  else
    cd $current
  fi
done

echo "Directory output : $name"
