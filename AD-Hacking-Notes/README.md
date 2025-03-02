# Attacking Active Directory (AD)
- `The notes i used to write` when i was learning how to hack Active-Directory.
- This Repo will keep being updated with not just my own code-samples and hacking tools, but also with additional notes.

## Overview
Active Directory (AD) can be thought of as a **network of multiple computers and devices** that share data and resources. It acts as a **large database** consisting of forests, domains, and objects.

- **Key Concept:**
  - "AD is its own universe."
- **Attack Surface:**
  - An AD environment can be compromised in numerous ways, often starting with capturing hashes and relaying them to gain a foothold.

---

## Table of Contents
1. [Active Directory Enumeration](#active-directory-enumeration)
2. [Tools of the Trade](#tools-of-the-trade)
3. [Techniques and Attacks](#techniques-and-attacks)
    - [LLMNR Poisoning](#llmnr-poisoning)
    - [SMB Relay](#smb-relay)
    - [Gaining Shell Access](#gaining-shell-access)
    - [IPv6 DNS Takeover](#ipv6-dns-takeover)
4. [Post Compromise Techniques](#post-compromise-techniques)
5. [Special Attacks](#special-attacks)
6. [Helpful Tips](#helpful-tips)
7. [Resources](#resources)

---

## Active Directory Enumeration
Enumeration is critical for success in AD attacks.

- **Initial Enumeration:** Start with tools and scripts to discover 
domain structures, users, and services.
  - [Initial Enumeration](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/ActiveDir%20Initial%20Enumr%20158357aeddc0804d9c3af7028764b05d.md)
- **External Recon:** Gather information from external resources to assist internal attacks.
  - [External Recon & Enum](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/External%20Recon%20&%20Enum%20154357aeddc08074b11bf86ac2cd31d5.md)

### Key Quote
> "Enumeration makes or breaks you as a hacker!"

---

## Tools of the Trade
Here are some must-have tools for attacking Active Directory:

- PowerView
- BloodHound
- CrackMapExec
- Responder
- Mimikatz

Learn more in the [Tools of the Trade](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Tools%20of%20the%20Trade%20152357aeddc080ecb6efd3bc4484f520.md) section.

---

## Techniques and Attacks

### LLMNR Poisoning
Perform local name resolution poisoning to capture credentials:
- [LLMNR Poisoning](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/LLMNR%20Poisoning%20152357aeddc08085b774f8589adb1b27.md)

### SMB Relay
Relay captured NTLM hashes to authenticate against systems:
- [SMB Relay](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/SMB%20Relay%20152357aeddc080e58f3dcd48137ccba2.md)

### Gaining Shell Access
Exploit identified vulnerabilities or relay credentials to gain shell access:
- [Gaining Shell Access](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Gaining%20Shell%20Access%20152357aeddc080158bb1d02598b26393.md)

### IPv6 DNS Takeover
Abuse IPv6 DNS resolution to redirect traffic:
- [IPv6 DNS TakeOver](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/IPv6%20DNS%20TakeOver%20153357aeddc080f0b735fabc2c475b0c.md)

---

## Post Compromise Techniques

### Enumeration
Once inside, continue enumeration to identify:
- Privileged users
- Domain trust relationships

- [Post Compromise Enumeration](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335.md)

### Maintaining Access
Ensure persistence for future exploitation:
- [Maintaining ACCESS & Pivoting](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Maintaining%20ACCESS%20&%20Pivoting%20163357aeddc080d28311cea834f6b0da.md)

---

## Special Attacks

### Pass-the-Hash and Pass-the-Ticket Attacks
Use captured hashes or tickets to authenticate:
- [PassAttacks](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/PassAttacks%20158357aeddc080f58290e64735ad4fdb.md)

### Kerberoasting
Extract and crack service account hashes:
- [Kerberoasting](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Kerberoasting%20159357aeddc080c1b0abcf4ee0f97270.md)

### Active Link File Attacks
Abuse Group Policy Preferences (GPP) for credentials:
- [Active Link File Attacks & GPP](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Active%20Link%20File%20Attacks%20&%20GPP%2015d357aeddc08065af89eb2b14b25863.md)

### ACL Abuse
Manipulate Access Control Lists to escalate privileges:
- [ACL Abuse Primer](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/ACL%20Abuse%20Primer%20168357aeddc080228447f9d30d2e1a77.md)
- [Abusing ACLs](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Abusing%20ACLs%20169357aeddc080fa8fc5cca78ad8fc87.md)

---

## Helpful Tips

- **Running Older PowerShell Versions:**
  Downgrading PowerShell to avoid logging can improve stealth. However, be aware this may still leave traces.
  
  > "Starting the downgrade over CMD will avoid detection."

- **Living Off the Land:**
  Leverage built-in tools for stealthy attacks.
  - [Living Of the Land](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Living%20Of%20the%20Land%20167357aeddc080f992fdcbd920843e0b.md)

---

## Resources
- Will be updated

### Articles
- [How to Hack Through a Pass-Back Attack: MFP Hacking Guide](https://www.mindpointgroup.com/blog/how-to-hack-through-a-pass-back-attack)

### Tools and Scripts
- [PowerSploit: Set-DomainUserPassword](https://powersploit.readthedocs.io/en/latest/Recon/Set-DomainUserPassword/)

### Advanced Topics
- [DSYNC Attack](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/DSYNC%20Attack%2016c357aeddc080768c1be13715dcf098.md)
- [Privileged Access](Attacking%20ADr%20152357aeddc080f7a7b8efb60d686183/Priviliged%20Access%2016c357aeddc080418300db2e7488b928.md)

---

**Note:** This document is a guide to learning and understanding Active Directory attacks. Always use these techniques ethically and in authorized environments.
