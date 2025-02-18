#Used to dump information about the Domanin.
#Actually Usefull due to it simplifying the way i have to access some commands :) 

Powershell -Version 2

try {
    import-Module ActiveDirectory 
    Import-Module .\PowerView.ps1 -ErrorAction Stop
} catch {
    Write-Host "PoverView-Module not Available, abort.."
    Exit
}

function loading {
    Write-Host "DONE.."
    Start-Sleep -Milliseconds 100
    for ($i = 0; $i -le 50 ; $i++) {
    Start-Sleep -Milliseconds 10
    Write-Host -NoNewline "." 
    }
}

$domainn = Get-Addomain | select Name
$domain = $domainn.Name

#Dumping Information about Accounts, having Password Encryption Reversing enabled.

Write-Host "Dumping Reversable Password Accounts, check OUTPUT FILE."
Get-ADUser -Filter 'userAccountControl -band 128' -Properties userAccountControl | select samaccountname > ReversedPasswordAcc.txt
loading


Write-Host ""

Write-Host "Dumping Password-Policy"
Get-DomainPolicy | select SystemAccess | Format-List * > $domain'Policy'.txt
loading 

Write-Host ""
Write-Host "Retrieving ALL RUNNING SERVICES"
$i = Get-Service | Select Status,Name | Select-String "Running"
echo $i

echo $i > CurrentServices.txt

Write-Host ""
Write-Host "RETRIEVING ALL KERBEROASTABLE ACCOUNS"

loading
$chad = get-DomainUser -SPN  | select Samaccountname | Format-List * 
echo $chad > $domain'Kerberoastable'.txt

Write-Host ""
Write-Host "Retrieving all RDP_applicable Users"
Get-ADGroupMember -Identity "Remote Management Users" 


Write-Host "
 v   |\           v
     | \               v
     |* \   v               boom
_    |__*\                _\ ___ /  /
 \-___|___i_->*  --o     *o* / \ \ / /
  \ o * o /               |  /-\  | /
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Wish we could DumpMore.... (I know i will dump more later.)
"

Write-Host "FINISHING UP AND CLEANING"
sc C:\Users\$env:USERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt ""
