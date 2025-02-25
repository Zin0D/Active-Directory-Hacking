# Gaining Shell Access

- Gaining Shells can be done through `Metasploit through PSexec`
    
    <aside>
    💡
    
    Using Domain , Name and Password
    
    </aside>
    
    <aside>
    💡
    
    We can also use a Hash to log into the `Computer (through Metasploit)`
    
    </aside>
    
    `METASPLOIT IS NOISY:`
    
    `psexec.py` is quiter, so this is a good tool to use, if wanting to get a shell (Still kinda noisy)
    
    - Building your own Tool is important.
    - Like metasploit, uses Hashes or the Password to connect to a machine.

Domain Compromise, does need a Shell, most of the time, it can be compromised without a Shell.

- `Using the machine can still be used for lateral movement etc.`
    - when gathering shells, keep in mind to also use 32bit payloads, due to 64bit CPU Architecture, we tend to overlook the 32bit running machines.

- Sweep Attacks and Background the Sessions in MetaSploit is a good attack strategy `(Noisy tho)`

Hashes are devided into parts, `Upper Part is: LM, Bottom is NT` I have to ch

![image.png](Gaining%20Shell%20Access%20152357aeddc080158bb1d02598b26393/image.png)

<aside>
💡

Average Tooling

</aside>

Non Metasploit:

- `SMBExec (far-less likely to be picked up)`
- `WMIExec`
- `PSExec`

We need to utilize Tools to leverage the SMB Protocol in order for us, to be able to execute a script, file, ..) And therefore, execute our own Payloads.

Take a look into this:

[](https://u0041.co/blog/post/2)

# PassBack-Attacks

Il put this here, since this is to small to have an own page.
If there is anything configured to access LDAP (Printer Credentials via LDAP Bind) or a WebService, or anything else)

If we cannot see the input-Password due to visibility proteciton, we may `forward the request to ourselfs.` We can do this by simply sending