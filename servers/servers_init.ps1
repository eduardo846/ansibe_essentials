#This script assumes Vagrant is properly installed and configured.

#Change to script's current directory, in case it was called from another one.
#Ref: https://stackoverflow.com/questions/4724290/powershell-run-command-from-scripts-directory
$scriptpath = $MyInvocation.MyCommand.Path
$scriptdir = Split-Path $scriptpath
Set-Location $scriptdir

Write-Output "controlserver:"
Set-Location ./controlserver
vagrant up

Write-Output "linuxserver01:"
Set-Location ../linuxserver01
vagrant up

Write-Output "linuxserver02:"
Set-Location ../linuxserver02
vagrant up

Write-Output "windowsserver01:"
Set-Location ../windowsserver01
vagrant up

Set-Location ..
