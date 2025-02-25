# IPv6 DNS TakeOver.

- Another form of `relaying`.
    - Who does `DNS for Ipv6?` I Disguise as a Ipv6 Dns Server    (Spoofing the DNS Server)

- Possible ways to get authentication: (LDAP Relay) (SMB Relay)
    - LDAP Authenticaiton to the DC (Not Admin Acc requiered)
    - SMB Authentication (Not Admin Acc requiered)
    - We `can capture the Hashes of some User and Relay the NTLM Hashes to the DC`

MITMv6 

One `of the craziest attacks we can pull off in the Enviroment without any access.`

`Dont forget to check the description :P`

![image.png](IPv6%20DNS%20TakeOver%20153357aeddc080f0b735fabc2c475b0c/image.png)

Bypassing the Honeypot:

- We get Information about the Machines, Honeypots can be detected throug this.

<aside>
💡

THIS SHIT IS A FUCKING CHEATCODE.

</aside>

- `In order to Mitigate IPv6`
    - Disabling Ipv can be done, but not the best choice.
    - Assigning static IPv6 (DHCP off)
    - If WPAD not used, disable it via Group Policy and WinHttpAutoProxySvc service.
    - Prevent `LDAP Relay, by signing LDAP` and LDAP channel binding. (Signing == Check if Packet is from original person)
    - Using Protected Users Group to store the Domain Accoutns that have excesive

1. *An IPv6 client periodically sends out solicit packets on the local network, seeking an IPv6 router.*
2. *When an IPv6 router is present, it sends out an advertise packet in response to the solicit packet. This advertise packet informs the client that the IPv6 router is available for DHCP services.*
3. *The IPv6 client replies with a request packet to the DHCPv6 server, asking for an IPv6 configuration.*
4. *Finally, the DHCPv6 server issues the IPv6 configuration to the IPv6 client, which specifies several things, including the IP address, default gateway, DNS servers, etc. This is all included in the reply packet.*

`Better explanation of How IPv6 Dns takeover works.`

[IPv6 Exploitation in AD environment](https://medium.com/@browninfosecguy/ipv6-exploitation-in-ad-environment-b22a7c3ec8af)

---

### `1. **Why DNS Spoofing or Takeover Works**`

### a. **No Authentication in DNS**

- The DNS protocol was not designed with robust authentication in mind. It operates on a "trust the responder" model. When a device queries for DNS, it trusts the first response it receives.
- In a network, if you can position yourself to respond faster than the legitimate DNS server, clients may accept your rogue responses.

### b. **Default Behavior of Clients**

- Most clients on a network rely on DHCP (Dynamic Host Configuration Protocol) to automatically configure their DNS settings. This means:
    - `If you provide a rogue DHCP response that lists your server as the DNS server, clients will trust it.`
    - If your response reaches the client faster than the legitimate DHCP server's response, you can effectively take over.

Using rouge Access DHCP Packets that specify our Attacker Machine as the DNS Server, and exploiting the Race Condition, of reaching the target faster than the legitimate Dns server is important.

- If no DNS Server present (like sometimes in the case of ipv6, then we can just set the DNS Server up).
- `Once Set up in the IPv6 Attack Chapter of TCM for example, we pretend to be WPAD and tell it to authenticate, since we are pointing to ourself, thus retrieving the NTLM Hashes , we can then use those to relay them and authenticate.`
- If the WinHTTP service is on = auto detects WPAD, which means, we see this, we know `we can do a crazy attack in AD`

![image.png](IPv6%20DNS%20TakeOver%20153357aeddc080f0b735fabc2c475b0c/image%201.png)

[A Basic Look into WPAD](https://jwcooney.com/2014/02/11/a-basic-look-into-wpad/)

- End.