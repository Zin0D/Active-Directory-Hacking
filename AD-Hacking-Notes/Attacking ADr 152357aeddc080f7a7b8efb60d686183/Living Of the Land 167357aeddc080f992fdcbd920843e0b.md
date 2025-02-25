# Living Of the Land

Living of the land, the proccess of staying on the machine, with no way of using other toos, relaying on `enumerating over the landed onto host`

- Running Powershell, try starting it up over cmd via `Powershell -version 2` in order to bypass login events for Powershell
- Using Powershell, we can check via Get-Help, or Get-Command , and usage of `/?` after a Command, syntax and requierments.
- Combining CMD commands such as `sc query *someService` via powershell comands (example: `Get-Service`) We can enumerate fast and be stealthy.*

<aside>
💡

Other Utilities (Non-Stealthy)

</aside>

[Net-Utility:](Living%20Of%20the%20Land%20167357aeddc080f992fdcbd920843e0b/Net-Utility%20167357aeddc0809ab943d4a6016e5a85.md)

- Utilize dsquery via upper mentioned Formula.
- dsquery wildcard search via `dsquery * (gets help page and shows what to list)`

<aside>
💡

LDAP Filtering

</aside>

An example for a LDAP Query would be: `userAccountControl:1.2.840.113556.1.4.803:=8192`.
We search for the UAC Attributes by querieng them:

in this case by querying the Object Identifer OIDs which would be the long string without the `:=8192`, `:=8192` is the Flag set for the UAC

![image.png](Living%20Of%20the%20Land%20167357aeddc080f992fdcbd920843e0b/image.png)

The Object Identifier is allways the same, and usually we would use the same string with different Flags, to check for

`A good example of filtering`

![image.png](Living%20Of%20the%20Land%20167357aeddc080f992fdcbd920843e0b/image%201.png)

Using dsquery, we can basically query a lot of information of the domain, either groups, users, and much more.

<aside>
💡

Get Accounts, which’s password is stored using RC4 encryp..)
 `Get-ADUser -Filter 'userAccountControl -band 128' -Properties userAccountControl`

</aside>

Powerfull.
or via powerview.
`Get-DomainUser -Identity * | ? {$_.useraccountcontrol -like '*ENCRYPTED_TEXT_PWD_ALLOWED*'} |select samaccountname,useraccountcontrol`