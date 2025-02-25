# Attacking ADr

[My-AD-Scripts](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/My-AD-Scripts%2016b357aeddc0805eb503f922927baf5d.md)

- In Short ActiveDirectory can be viewed as a Network of Multiple Computers and Devices, that have access to shares in which they can share data. Its a large Database, consisting out of Forests.
- `AD is an own universe.`
- `AN AD Enviroment can lead to a foothold in many ways`
    
    [ActiveDir Initial Enumr](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d.md)
    
    [Tools of the Trade](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Tools%20of%20the%20Trade%20152357aeddc080ecb6efd3bc4484f520.md)
    
    [LLMNR Poisoning](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/LLMNR%20Poisoning%20152357aeddc08085b774f8589adb1b27.md)
    
    [SMB Relay](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/SMB%20Relay%20152357aeddc080e58f3dcd48137ccba2.md)
    
    [Gaining Shell Access](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Gaining%20Shell%20Access%20152357aeddc080158bb1d02598b26393.md)
    
    [IPv6 DNS TakeOver.](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/IPv6%20DNS%20TakeOver%20153357aeddc080f0b735fabc2c475b0c.md)
    
- Note to myself:
    - Seems like this whole AD Game, is a matter of capturing hashes and trying to relay them through to us or to a service we want to use. - `To get in.`
    - Answer:
        - Its that and more, which will be gotten into in all the after-pages.
    
    ![image.png](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/image.png)
    

In order to own the domain, we need to escelate Priviliges and 

Check out this Article abt printer hacking in AD. 

**`Multi-Function Peripherals (MFPs)**` 

[How to Hack Through a Pass-Back Attack: MFP Hacking Guide](https://www.mindpointgroup.com/blog/how-to-hack-through-a-pass-back-attack)

`Enumeration makes or brakes you as a hacker` !!! 

[External Recon & Enum](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/External%20Recon%20&%20Enum%20154357aeddc08074b11bf86ac2cd31d5.md)

[Post Compromise Enumeration ](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335.md)

[AD Post Compromise Attacks.](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/AD%20Post%20Compromise%20Attacks%20155357aeddc080668491df5ec0ad5e97.md)

[PassAttacks](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/PassAttacks%20158357aeddc080f58290e64735ad4fdb.md)

[Kerberoasting](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Kerberoasting%20159357aeddc080c1b0abcf4ee0f97270.md)

[Active Link File Attacks & GPP ](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Active%20Link%20File%20Attacks%20&%20GPP%2015d357aeddc08065af89eb2b14b25863.md)

[Maintaining ACCESS & Pivoting. ](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Maintaining%20ACCESS%20&%20Pivoting%20163357aeddc080d28311cea834f6b0da.md)

<aside>
💡

Running a lower Powershell Version to not be logged, (a stealthier Approach), Downgrading it , is still a history command to keep in mind.

 `(STARTING THE DOWNGRADE OVER CMD WILL RESULT IN, IT NOT DETECTING IT)`

</aside>

[Living Of the Land](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Living%20Of%20the%20Land%20167357aeddc080f992fdcbd920843e0b.md)

[ACL Abuse Primer](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77.md)

[Abusing ACLs](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Abusing%20ACLs%20169357aeddc080fa8fc5cca78ad8fc87.md)

[DSYNC Attack](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/DSYNC%20Attack%2016c357aeddc080768c1be13715dcf098.md)

FOR ACL ATTACKS AND SCRIPTING: 

[Set-DomainUserPassword - PowerSploit](https://powersploit.readthedocs.io/en/latest/Recon/Set-DomainUserPassword/)

[Priviliged Access](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Priviliged%20Access%2016c357aeddc080418300db2e7488b928.md)