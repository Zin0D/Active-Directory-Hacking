# Kerberoasting

It abuses Server Accounts, 

- We want to access an application or a service, so we request from the KDC (Key Distrubition Center)

<aside>
💡

Kerberos Authentication 1o1

</aside>

`Request a TGT` (REQUEST VIA NTLM HASH)

`Receive a TGT`

`Request TGS`

`Receive a TGS` (Encrypted with the Hash of the Service Account)

So the point is, to get a TGT , Ticket Granting Ticket, in order to request a Ticket Granting Ticket.

`We can use a tool to perform the TGT Attack, which, when requesting a TGS, we will have the HASH of the Service Account:`

![image.png](Kerberoasting%20159357aeddc080c1b0abcf4ee0f97270/image.png)

`If no Logon is on the Account itself, this could indicate a HoneyPot Account.`

<aside>
💡

Kerbrute.

</aside>

Once we use Kerbrute, it retrieves the Kerberos Service Hash.

Kerbrute uses the PREAuthentication Method of Kerberos and determines, based on its received Response if the User exists within the domain or not.

- Kerbrute `is a more stealthier, Kerberos preauthenticate failures don’t trigger logs or alerts`
- Kerbrute in comb with :

[https://github.com/insidetrust/statistically-likely-usernames](https://github.com/insidetrust/statistically-likely-usernames)

![image.png](Kerberoasting%20159357aeddc080c1b0abcf4ee0f97270/image%201.png)

Kerbrute is good to initially , map `all existing accounts` on a domain

Another side note is, once we have usernames, trying to gain `a System Shell, allows us to almost enumerate the whole domain`, and do a lot with the domain itself & attacks.

SPNs are accounts, that have the SPN identifier to signal Kerberos, that those are Service Accounts mapped to a specific Service.

# Attacking Kerberos.

By having either an `NTLM / Cleartext Password of an account`, `a shell in which we are a domain user account,` or an `adimistrator level access on a joined Machine`

Domain accounts running services are often local Administrators or high privilied domain accounts, due to the nature of said services.

By requesting a TGS from Kerberos, we can brutforce the TGS content, by brutforcing the passw$0rd. `(TGS Reply is encrypted , using the requested service ntlm hash)`

`Golden Ticket Attacks:`

Golden Ticket Attacks are, when compromised KRBTGT account hashes get abused, to forge TGT for any User on the Domain, including DomainAdmins `(Meaning , owning the domain)`