#!/usr/bin/bash


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
  ls -a
  current=""
  echo ">> chose dir:"
  read current
  if [[ $current == "this" ]];then
    tree > $output
    break
  else
    cd $current
  fi
done

cd ~
echo "Directory output : $name"
