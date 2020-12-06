#!/usr/bin/bash

drive_name="/media/amirhossein/92FD-4698"

# Take me to root
cd /

# Get a copy
zip -e archivename.zip usr

# Set the output flash drive
if ! [[ "$(lsblk)" =~ .*"$drive_name"*. ]]; then
    result="$(udisksctl mount -b $drive_name)"
    result="$(echo $result | grep -Po '(?<=_)\d{8}')"
fi

# Send the copy
mv archivename.zip $drive_name

# Clear path
rm -m archivename.zip
udisksctl unmount -b $drive_name
