# PassAttacks

- The main methodology is, each captured hash and password will be sprayed, we will see where we are `Administrator.`

- NTLMv2 can only be relayed for the current Session.
- When Hashes are used, we need an `NTLMv1 hash, to pass the hash`, NTLMv2 is used for relaying the Hash.
    - Brutality of Pass the Hash, is that no matter the Password lenght, once captured, we need to relay it, or crack it. (cannot relay the same NTLM-NET Response twice)
    

<aside>
💡

An Example of crackmapexec usage

</aside>

![image.png](PassAttacks%20158357aeddc080f58290e64735ad4fdb/image.png)

`with —sam, on successfull login, we can dump out the sam database`

Crackmapexec can also dump out the `LSA`. contains all passwords from the login. 

`crackmapexec itself is pretty strong and good.`

<aside>
💡

The general Methodology:

</aside>

![image.png](PassAttacks%20158357aeddc080f58290e64735ad4fdb/image%201.png)

VERY IMPORTANT! THIS IS HOW THIS WORKS.

You can do this against most Networks undetected, no AV detection.

- We will only maybe be picked up by `trained SOC Analysts`, but in order to Mitigate, we can use other Techniques ;)

<aside>
💡

Pass the Hash Mitigation

</aside>

- Limit account re-use:
    - Don’t use same passwords on accounts.
    - Disable Guest and Administator accounts.
    - Limit who are local administrators (Least privilige principle)
    
- `Privilige Access Management.`
    - Automatically rotate passwords on check out and check in.
    - Limits attacks due to rotating passwords.

<aside>
💡

Password Spraying

</aside>

We can spray the Passw$ord and check if we PWN a machine, for example a username and password to local machines and smb stuff etc.

![image.png](PassAttacks%20158357aeddc080f58290e64735ad4fdb/image%202.png)

IT can result in potentially gaining a foothold on a target network.

[https://github.com/insidetrust/statistically-likely-usernames](https://github.com/insidetrust/statistically-likely-usernames)

`Enumerate valid users with kerbrute.`

It is the best, to obtain the password policy before attacking, to not log out any accounts. Not allways possible tho.

Generally speaking, crackmapexec is perfect for password spraying:

`We can also use a Windows Tool writtein powershell:`

[https://github.com/dafthack/DomainPasswordSpray](https://github.com/dafthack/DomainPasswordSpray)

![image.png](PassAttacks%20158357aeddc080f58290e64735ad4fdb/image%203.png)

Via `CRACKMAPexec` we can easily perform a one time Password Spray, just need Usernames and Passw$ords. Fucking Active Directory.

Since we risk detection, i included this article that goes a bit more detailed into how to Mitigate & Stay undetected:

[Trimarc Research: Detecting Password Spraying with Security Event Auditing](https://www.hub.trimarcsecurity.com/post/trimarc-research-detecting-password-spraying-with-security-event-auditing)

Don’t forget about the external Password Spraying Attacks :P

# Impacket.

Impacket is a tool written in python, it has its own libary. `(I fucking need to use it)` 

- **Psexec.py**
    
    One of the most useful tools in the Impacket suite is `psexec.py`. Psexec.py is a clone of the Sysinternals psexec executable, but works slightly differently from the original. The tool creates a remote service by uploading a randomly-named executable to the `ADMIN$` share on the target host. It then registers the service via `RPC` and the `Windows Service Control Manager`. Once established, communication happens over a named pipe, providing an interactive remote shell as `SYSTEM` on the victim host.
    

Code: bash

```bash
psexec.py inlanefreight.local/wley:'transporter@4'@172.16.5.125
```

- **wmiexec.py**
    
    Wmiexec.py utilizes a semi-interactive shell where commands are executed through Windows Management Instrumentation. It does not drop any files or executables on the target host and generates fewer logs than other modules. After connecting, it runs as the local admin user we connected with (this can be less obvious to someone hunting for an intrusion than seeing SYSTEM executing many commands). This is a more stealthy approach to execution on hosts than other tools, but would still likely be caught by most modern anti-virus and EDR systems. We will use the same account as with psexec.py to access the host.
    

Code: bash

```bash
wmiexec.py inlanefreight.local/wley:'transporter@4'@172.16.5.5
```