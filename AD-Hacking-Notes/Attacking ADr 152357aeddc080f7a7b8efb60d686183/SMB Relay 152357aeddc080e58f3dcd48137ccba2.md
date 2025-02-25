# SMB Relay

- Instead of cracking hashses, we can parse those hashes to `authenticate.`
- In order for this to work, `SMB signing must either be off or not enforced`
    
    & relayed credentials gotta be admin on the machine `(local admin)`
    
    You can relay the credentials to a Machine on the Domain, the accounts relayed have to be local admin on the machine. WHY? I dont know yet, but i will know why.
    

<aside>
💡

Turn OFF SMB and HTTP on Responder, `in order to not Capture them`

</aside>

<aside>
💡

Setting up the SMB Relay ntlmrelay

- When setting up the SMB Relay, `ntlmrelay.py`
</aside>

- - Responder will forward the Hashes to ntlmr..) and ntlm…) will then pass it to the machine’s IP that has SMB Signing disabled or not requiered and is present in the “Targets” file.

- `We can also send commands over, get a revershe shell or dump the sam file`
- We can even create an admin account over the relay attack, which allows us to have `persistence.`

We cannot relay to ourselfs. But Why???

<aside>
💡

We can Mitigate the SMB Attack

</aside>

- Enable SMB Signing.
- Disable NTLM Authentication.
- Account tiering.
- Local admin restriction `(Good safety principles)`

[SMB Protocol Explained: Understanding its Security Risks and Best Practices](https://www.tripwire.com/state-of-security/smb-protocol-explained-understanding-its-security-risks-and-best-practices)

[Understanding NTLM Authentication and NTLM Relay Attacks](https://www.vaadata.com/blog/understanding-ntlm-authentication-and-ntlm-relay-attacks/)