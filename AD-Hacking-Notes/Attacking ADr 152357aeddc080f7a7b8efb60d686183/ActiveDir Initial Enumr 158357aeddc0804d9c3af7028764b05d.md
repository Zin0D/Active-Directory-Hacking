# ActiveDir Initial Enumr

- Key Data Points
    - ActiveDir Users.
    - ActiveDir Joined Computers `(Servers, DC, MailServers, Databases, Shares, etc..)`
    - `ActiveDir Services`
    - Quick Wins (Vuln Hosts & Services)

<aside>
💡

Enumeration Plan

</aside>

Due to extensive Data being stored in AD

`Enumeration is Key, without a Plan, barelly possible though.`

- We want to first use `WIRESHARK` and `TCPDUMP` in order to see Network Segmentation, structure, and any other Hints.
- `mDNS` is absoloutely insecure lol

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image.png)

# Responder.

`We found some Hosts, time to use Responder to try various attacks.`

- A tool built to Poision NBT-MS, LLMNR and MDNS requests.
- Setting up rouge IPv6DnsServers, capturing or relaying NTLMv2 Hashes.
    - Able to listen via Analyze Mode, `-A flag`
    - `Analyze Mode used to only listen without causing noise`

After that we can easily just start to ping sweep a Network Cidr range, and see if they’re online.

<aside>
💡

Apperantly another Tool for pinging fping.

</aside>

Scanner, able to enumerate Ports and perform Banner Grabbing.     
`fping -asgq 172.16.5.0/23`

if possible to use, deffo better.

but using Nmap is also okay, i guess, just a bit more difficult.

# Identify Users

- `Obtaining a valid user is critical in the early stages.`
- `Use Kerbrute, SmbNullsessions or LDAP Anonymous Binds.`

<aside>


Kerbrute

</aside>

- Internal AD Username & Enumeration
    - Kerbrute `is a more stealthier, Kerberos preauthenticate failures don’t trigger logs or alerts`
    - Kerbrute in comb with :

[https://github.com/insidetrust/statistically-likely-usernames](https://github.com/insidetrust/statistically-likely-usernames)

![image.png](Kerberoasting%20159357aeddc080c1b0abcf4ee0f97270/image%201.png)

Kerbrute is good to initially , map `all existing accounts` on a domain

Another side note is, once we have usernames, trying to gain `a System Shell, allows us to almost enumerate the whole domain`, and do a lot with the domain itself & attacks.

<aside>


Enumerating & Retrieving Password Policies.

</aside>

With valid domain credentials, the password policy can be obtained w:

- `Crackmapexec`
- `rpcclient`
- `IF SMB NULL or LDAP anonymous bind given` we can obtain aswell Passw0rd.Policy.

`rpcclient`

part of the samba suite and used to interact withj MS-RPC functions

[rpcclient](https://www.samba.org/samba/docs/current/man-html/rpcclient.1.html)

`Most important SAMR (Samba) commands usable with the tool.`

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/95ba7136-f745-4cb1-82f5-638279c489dc.png)

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%201.png)

`rpcclient -U "" -N 172.16.5.5`

```
lsaenumsid , lookupsids
Retrieves some SIDs?
```

<aside>


Enum4linux to gain INFORMATION about the domain.

</aside>

Mostly Pre-installed, able to query

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%202.png)

# LDAP Anonymous Bind

`via LDAP anonym..) we can retrieve information about the current domain.` 

- `Deprecated`, still available from time to time but in order to query LDAP, we `need usually valid credentials`

We can use the built in tools for LDAP Anonymous bind.

<aside>


Enumerating Password Policy from Windows.

</aside>

There are built in tools to query domaininfo by default on windows, we need to be authetnticated to the domain tho.

Using `net.exe`

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%203.png)

the net utility.

We can also import modules to query information, such as with PowerView.

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%204.png)

Its incredibely important to not lock out any accounts, one suspiscion and two, keeping ur job.

`Passw0rd spraying with 2 attempts, waiting for an hour or 2 and then trying again is the best bet.`

# Enumerating Valid Users.

`When using rpcclient, we can query for users accounts on the domain`

When using `Crackmapexec,` we can do more than that, inclduing see how many bad login attempts happened :D

<aside>


Enumerating Users with Kerbrute. I Stealthy.

</aside>

Kerberos Pre Auth is particular stealthy.

[LDAPWiki: Kerberos Pre-Authentication](https://ldapwiki.com/wiki/Wiki.jsp?page=Kerberos%20Pre-Authentication)

`Once cause failed Logon is not saved as a :` 

[4625(F) An account failed to log on. - Windows 10](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4625)

Kerbrute tries to send TGT to the DC without PRE Kerb Auth, `if a username exists, the DC wants to perform the Pre Kerb Auth.`

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%205.png)

When using kerbrute, `we will specify the fqd (FullyQualifiedDomain Name) , or also in this case as the DNS-Resolve name` ,and the domaincontrollers, ip-adress, including a user list.

`THE LIST:`

[https://github.com/insidetrust/statistically-likely-usernames/blob/master/jsmith.txt](https://github.com/insidetrust/statistically-likely-usernames/blob/master/jsmith.txt)

[https://github.com/insidetrust/statistically-likely-usernames](https://github.com/insidetrust/statistically-likely-usernames)

`And after enumerating , we find this:` 

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%206.png)

`Using Kerbrute, we dont need to have a Null Session or anything , it works like that.`

- On the other User Enumeration, we do need a NullSession to use Crackmapexec via SMB or rpcclient

After enumerating the valid usernames, via KERBRUTE, we can use or write a script to filter out the available users.

We can also use the No-Preauth feature and abuse that, checking for accounts that have it set.
If enumerated , it will result in a valid account:

`python3 /usr/share/doc/python3-impacket/examples/GetNPUsers.py DANTE.local/ -dc-ip 172.16.1.20 -usersfile users.txt -request`


# Digging further into the Domain.

Crackmapexec, is able to use Credentials. in order to further `enumerate Users, Groups` and so on.

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%207.png)

CME can do a lot. 
Instance; crackmapexec smb x.x.x.x -u guest - something —(shares, or users, groups …) 

By using `-h` we can also check out any information about a Modul.

`SMB Map is a tool , used to enumerate shares.`

[https://github.com/ShawnDEvans/smbmap](https://github.com/ShawnDEvans/smbmap)

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%208.png)

<aside>


Enumerating RID via rpcclient

</aside>

We can utilize Tools to either extract the `SID for the Domain` itself, in which the last 4 Digits, are of a user.

`We can utilize RPCClients to allready gather the RID’s for the users.`

USING THE SID and its corresponding RID (Host identifier), mostly only RID needed, `we can query additional information about the user of the domain via rpcclient`

![image.png](ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d/image%209.png)