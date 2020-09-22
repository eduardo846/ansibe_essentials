#!/bin/bash

#This script assumes Vagrant is properly installed and configured.

#Change to script's current directory, in case it was called from another one.
#Ref: https://stackoverflow.com/questions/3349105/how-to-set-current-working-directory-to-the-directory-of-the-script
cd "$(dirname "${0}")"

printf "controlserver:\n" && cd ./controlserver && vagrant halt
printf "linuxserver01:\n" && cd ../linuxserver01 && vagrant halt
printf "linuxserver02:\n" && cd ../linuxserver02 && vagrant halt
printf "windowsserver01:\n" && cd ../windowsserver01 && vagrant halt
cd ..
