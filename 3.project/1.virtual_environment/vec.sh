#!/usr/bin/bash

# a function to create a new environment
function create_env {

    if [ -z $1 ]; then
      name=$(whoami) # if the user input was empty
    else
      name=$1 # set the user input name
    fi

    # dir check
    if [ -d "/$1" ]; then
      # if ve was already been created
      echo "Sorry, already have a virtual environment with the name $1."
      exit -1
    fi

    python3 -m venv name # create environment
}


# first we check , if user system supports python and pip ?
if [[ "$(python3 -V)" =~ "Python 3" ]]; then
    # this means user have python3 so we begin
    for envs in $*; do
        create_env $envs
    done;
    echo "All done, OK."
else
    # this mean the user system does not support python3
    echo "System not supporting python3. Enter your pass word to install it."
    sudo apt-get update
    sudo apt-get install python3.6
    sudo apt install python3-pip
    python3 --version
    pip3 --version
    pip3 install virtualenv
    echo "Python3 and pip3 installed successfully. Run the program again."
fi
