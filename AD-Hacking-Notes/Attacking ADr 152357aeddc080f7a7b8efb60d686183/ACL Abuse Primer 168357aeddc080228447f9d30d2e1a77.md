# ACL Abuse Primer

Access Control List, short ACL.

ACLS are used to controll what type of Permissions a DomainObject has over resources and other types of data.

`The Settings inside the ACL are called ACEs`

Every Object has an ACL, and can have multiple ACEs, since they may be able to access x and y, and not z.

<aside>
💡

Types of ACLs

</aside>

`Discretionary Access Control List (DACL)`

`System Acess Control List (SACL)`

DACL

- Is made up by ACEs that either deny or allow.
- When someone attemts to access an object, the system will check the `Dacl`

By default, `the DACL for that Object without any ACEs, will deny access to all users`, `an Object without a DACL, will be able to be accessed by all`

SACL

- Allows Admin to log access attempts made to Secured Objects. (perfect for ids and ips probally)

`DACL IN ACTION: (PERMISSION ENTRIES == DACL) , all Permsettings == ACEs`

![image.png](ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77/image.png)

`ACEs can apply to also child-Objects of an Object.`

ACEs are mostly unnoticed and cannot be found through vulnerability scanners :D 

PowerViewAbuse: _D

- `ForceChangePassword` abused with `Set-DomainUserPassword`
- `Add Members` abused with `Add-DomainGroupMember`
- `GenericAll` abused with `Set-DomainUserPassword` or `Add-DomainGroupMember`
- `GenericWrite` abused with `Set-DomainObject`
- `WriteOwner` abused with `Set-DomainObjectOwner`
- `WriteDACL` abused with `Add-DomainObjectACL`
- `AllExtendedRights` abused with `Set-DomainUserPassword` or `Add-DomainGroupMember`
- `Addself` abused with `Add-DomainGroupMember`

![image.png](ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77/image%201.png)

ACE AttackPaths

![image.png](ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77/image%202.png)

To manually enumerate we can do this:
`Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName > ad_users.txt`

```powershell
foreach($line in [System.IO.File]::ReadLines("C:\Users\htb-student\Desktop\ad_users.txt")) {get-acl  "AD:\$(Get-ADUser $line)" | Select-Object Path -ExpandProperty Access | Where-Object {$_.IdentityReference -match 'DOMAIN\USER'}}
```

![image.png](ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77/image%203.png)

We `basically check for each user in the domain, if there is a user we have an ACL for some reason.`

If `We do, we can check what type of ACL and what does it bring us, taking over the ACC.`

<aside>
💡

ENUMERATING RIGHTS FOR USERS

</aside>

 `$sid1 = Convert-NameToSid SOMETHING`

`Get-DomainObjectACL -ResolveGUIDs -Identity * | ? {$_.SecurityIdentifier -eq $sid1} -Verbose`

AND FOR GROUPS, SEE WHAT ACLS THEY HAVE.
`$group = Convert-NameToSid "Something"`

`Get-DomainObjectACL -ResolveGUIDs -Identity * | ? {$_.SecurityIdentifier -eq $group} -Verbose`

We just recurse through it all, we compromised one account, what users does he control, what rights does he have? Checking for Groups hes part off, and if those Groups are part off something else.

`ACLs are brutal, unfortunately, the syntax is gay`

We can set our own variables via $, so we dont need specific names, we can just do $something = something

# Using Bloodhound because Manual is 😟

Using Sharphound to collect the data, we can upload it  onto `Bloodhound to Enumerate the Domain`

Selecting the Wley user as the starting node. We can check the Outbund Control Rights, this will show objects we have control over.

![image.png](ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77/image%204.png)

- If clicking on Transitive Object Control, we can see the whole Attack Path through Bloodhound.