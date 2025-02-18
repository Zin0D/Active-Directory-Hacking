#Using PowerView , if not wanted, just ignore, due to import not working out.
#This is the same above, but gives it a bit more clear out, it also gets Groups.
#But takes forever to run, so i included it last.

#Get-ExecutionPolicy
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Powershell -Version 2 
Write-Host "RUNNING RADICAL SCRIPT"
try {
    Import-Module .\PowerView.ps1 -ErrorAction Stop #Radical due to it possibly being picked up by AV
} 
catch {
    Write-Host "Get PowerViecdw on local machine"
    sc C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt ""
    Exit
}

Write-Host "To Continue , Press 1"

[int] $continue = 1

while ($true) {
    if ($continue -eq 1 ) {
        $user_read = Read-Host "Enter Group OR Username to further Enumerate" #Lets say u found user x
        $sid = Convert-NameToSid $user_read
        Get-DomainObjectACL -ResolveGUIDs -Identity * | ? {$_.SecurityIdentifier -eq $sid} -Verbose
        $continue = Read-Host "To Continue, Press 1"

    } else {
        break
    }
}

Write-Host "Exiting, for normal manual enum about Groups, Refer to ACLEasyEnum.ps1"

#Say Bye
sc C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt ""