#!/usr/bin/bash

# This bash script is used to backup a user's home directory to /tmp/.

function backup {

    # -z checks if the user inputs anything or not
    if [ -z $1 ]; then
      user=$(whoami)
    else
        if [ ! -d "/home/$1" ]; then
            echo "Requested $1 user home directory doesn't exist."
            exit 1
        fi
        user=$1 # if the dir exist then we set it to the file path
    fi

    input=/home/$user
    output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

    # The function total_files reports a total number of files for a given directory
    function total_files {
        find $1 -type f | wc -l
    }

    # The function total_directories reports a total number of directories
    # for a given directory.
    function total_directories {
        find $1 -type d | wc -l
    }

    # This function and the next one, counts the amount of the zipped files
    function total_archived_directories {
        tar -tzf $1 | grep  /$ | wc -l
    }

    function total_archived_files {
        tar -tzf $1 | grep -v /$ | wc -l
    }

    tar -czf $output $input 2> /dev/null

    # counting the files of input dir and the results files
    src_files=$( total_files $input )
    src_directories=$( total_directories $input )

    arch_files=$( total_archived_files $output )
    arch_directories=$( total_archived_directories $output )

    echo "########## $user ##########"
    echo "Files to be included: $src_files"
    echo "Directories to be included: $src_directories"
    echo "Files archived: $arch_files"
    echo "Directories archived: $arch_directories"

    # if the number of files are similar it means the backup process was correctly
    # done.
    if [ $src_files -eq $arch_files ]; then
        echo "Backup of $input completed!"
        echo "Details about the output backup file:"
        ls -l $output
    else
        echo "Backup of $input failed!"
    fi

}

# Program starts to backup every dir that user inputs
for directory in $*; do
    backup $directory
done;
