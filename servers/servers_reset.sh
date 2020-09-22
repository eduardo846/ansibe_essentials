#!/bin/bash

#This script assumes Vagrant is properly installed and configured.

printf "Are you sure you want to reset the lab environment (y/n)?: " && read
REPLY="$(printf "%s" "${REPLY}" | tr "[:upper:]" "[:lower:]")"

if test "${REPLY}" = "y" -o "${REPLY}" = "yes"; then
  #Change to script's current directory, in case it was called from another one.
  #Ref: https://stackoverflow.com/questions/3349105/how-to-set-current-working-directory-to-the-directory-of-the-script
  cd "$(dirname "${0}")"

  printf "controlserver:\n"
  cd ./controlserver && vagrant destroy -f
  rm -rf .vagrant

  printf "linuxserver01:\n"
  cd ../linuxserver01 && vagrant destroy -f
  rm -rf .vagrant

  printf "lonuxserver02:\n"
  cd ../linuxserver02 && vagrant destroy -f
  rm -rf .vagrant

  printf "windowsserver01:\n"
  cd ../windowsserver01 && vagrant destroy -f
  rm -rf .vagrant

  cd ..
fi
