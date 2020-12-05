#!/usr/bin/bash

drive_name="usb_flash_drive"

# Take me to root
cd /

# Get a copy
zip -e  archivename.zip usr
# Set password
echo "big_omega"
echo "big_omega"

# Set the output flash drive
if ! [[ $drive_name in "$(lsblk)" ]]; then
    result="$(udisksctl mount -b $drive_name)"
    result="$(echo $result | grep -Po '(?<=_)\d{8}')"

# Send the copy
mv archivename.zip $result

# Clear path
rm -m archivename.zip
$ udisksctl unmount -b $drive_name
