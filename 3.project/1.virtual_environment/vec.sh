#!/usr/bin/bash

# a function to create a new environment
function create_env {

    if [ -z $1 ]; then
      name=$(whoami) # if the user input was empty
    else
      name=$1 # set the user input name
    fi

    # dir check
    if [ -d "./$1" ]; then
      # if ve was already been created
      echo "Sorry, already have a virtual environment with the name $1."
      exit -1
    fi
}
