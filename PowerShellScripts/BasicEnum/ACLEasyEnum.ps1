# MakeSure to Bypass ExecutionPolicy on Powershell to run Scripts.
#Get-ExecutionPolicy
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
Powershell -Version 2 
Write-Host "PLEASE DONT ENTER INPUT VIA QUOTES"
try {
    Import-Module ActiveDirectory -ErrorAction Stop
    Import-Module .\PowerView.ps1 -ErrorAction Stop
} 
catch {
    Write-Host "AD-Module not installed. [X], or PowerView [X]"
    Exit
}

$checkgroupnesting = Read-Host "Which Group to Enumerate MemberNesting?"
Get-DomainGroup -Identity "$checkgroupnesting" | select Memberof

[int] $trueornot = Read-Host "To Enum Group, PRESS 1"

if ($trueornot -eq 1) {
    
    $groupsid = Convert-NameToSid $checkgroupnesting
    Get-DomainObjectACL -ResolveGUIDs -Identity * | ? {$_.SecurityIdentifier -eq $groupsid} -Verbose
} else {
    Write-Host "EXITING"
    sc C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt ""
    Exit
}

