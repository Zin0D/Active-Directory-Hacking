# AD Post Compromise Attacks.

- Using Tools
    - CrackmapExec.
    - SecretsDump

We want to gather as many Hashes as possible, Spray the Network and so on.  (Undetected If Not

<aside>
💡

Pass the Password

</aside>

Passing around the Password and a specified user

- We want to check, using crackmapexec, if we have another `user on the domain, that has the same password`

Pass the Password

![image.png](AD%20Post%20Compromise%20Attacks%20155357aeddc080668491df5ec0ad5e97/image.png)

<aside>
💡

Pass the Hash:

</aside>

![image.png](AD%20Post%20Compromise%20Attacks%20155357aeddc080668491df5ec0ad5e97/image%201.png)

<aside>
💡

Dumping via Secretsdump

</aside>

```bash
secretsdump.py <Account>:@<IP> -hashes <Account-Hash>
```

<aside>
💡

LSASSY Attacks

</aside>

When enumerating the Security Policies, we can use crackmapexec, to dump the LSASSY file, which contains the policies and also `Credentials.`

- `If an Active user is logged in we could dump those credentials`

In this case, we want to get either a Domain Admin account or the Local dc Admin account.

All Domain Admins are automatically part of the local Admins on the machine, the default Admin of the Dc is not automatically included in the Domain-Admins group.

<aside>
💡

WDigest

</aside>

When running Secretsdump, we can also check for `WDIGEST`.

- Force Wdigest (If login occours) So when someone logs in , we can capture the Plain-Text password.