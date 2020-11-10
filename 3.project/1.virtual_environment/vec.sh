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

# this function installs python3
function install_python {
    sudo apt-get update
    sudo apt-get install python3.6
    python3 --version
    echo "Python3 is now installed on your system."
}

# this function installs pip3
function install_pip {
    sudo apt-get update
    sudo apt install python3-pip
    pip3 --version
    echo "Pip3 is now installed on your system."
}

# this function installs virtualenv
function install_venv {
    sudo apt-get update
    pip3 install virtualenv
    pip3 freeze | grep virtualenv
    echo "Virualenv is now installed on your python3."
}

# this function installs python3 and pip3 and virtualenv on user system
function install_all {
    install_python
    install_pip
    install_venv
    echo "Run the program again."
}


# shell execute
if $1 = "Reset"; then
    install_all
    exit 1
fi

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
    install_all
fi
