#This script assumes Vagrant is properly installed and configured.

$REPLY = (Read-Host -Prompt "Are you sure you want to reset the lab environment (y/n)?:").ToLower()

if ($REPLY -eq "y" -or $REPLY -eq "yes") {
  #Change to script's current directory, in case it was called from another one.
  #Ref: https://stackoverflow.com/questions/4724290/powershell-run-command-from-scripts-directory
  $scriptpath = $MyInvocation.MyCommand.Path
  $scriptdir = Split-Path $scriptpath
  Set-Location $scriptdir

  Write-Output "controlserver:"
  Set-Location ./controlserver
  vagrant destroy -f
  Remove-Item -Recurse -Force .\.vagrant

  Write-Output "linuxserver01:"
  Set-Location ../linuxserver01
  vagrant destroy -f
  Remove-Item -Recurse -Force .\.vagrant

  Write-Output "linuxserver02:"
  Set-Location ../linuxserver02
  vagrant destroy -f
  Remove-Item -Recurse -Force .\.vagrant

  Write-Output "windowsserver01:"
  Set-Location ../windowsserver01
  vagrant destroy -f
  Remove-Item -Recurse -Force .\.vagrant

  Set-Location ..
}
