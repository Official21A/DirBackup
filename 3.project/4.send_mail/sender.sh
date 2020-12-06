#!/usr/bin/bash

#Install
sudo apt install mailutils
# Show details
mail -V

# Get mail subject
echo "> Enter the subject "
read subject

# Get mail body form
echo "> Enter the mail body or file name "
read body

# Get the destination email
echo "> To ? "
read mail_domain

# Send the mail
mail -s $subject $mail_domain <<< $body
