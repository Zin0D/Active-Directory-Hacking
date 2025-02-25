# Post Compromise Enumeration

- Enumerating the domains SAM databse via `ldapdomaindump`
    - ldapdomaindump needs a password and a username that can authenticate to the domain itself, that user mostly can enumerate a service, or the whole domain by default.
        
        ![image.png](Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335/image.png)
        
        ![image.png](Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335/image%201.png)
        
- As seenable, ldampdomaindump uses `LDAP` to access shares and enumerate Objects and Policies , including user Descriptions etc.

<aside>
💡

Enumeration with Bloodhound

</aside>

When using Bloodhound we need to use `neo4j`

[](https://neo4j.com/)

Its a database running on ur Machine as a `webservice`

- We need to setup Bloodhound itself which is the Graphical-UI hosted as a Webservice aswell:
- And then the injector which collects the data and parses it over to Bloodhound.
    - `The magic happens through the injector`

![image.png](Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335/image%202.png)

`Then upload it:`

![image.png](Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335/image%203.png)

![image.png](Post%20Compromise%20Enumeration%20155357aeddc080e9b6c0c8b17bbfe335/image%204.png)

- Bloodhound is insane, a really good way of enumerating the whole AD Enviroment.
    
    

# Plumhound

- The `“Sister”` of Bloodhound

[https://github.com/PlumHound/PlumHound](https://github.com/PlumHound/PlumHound)

- Utilizies Bloodhounds Information!!!!
- Also a really good tool.

And at last, PingCastle.

- A tool made for Windows Usage.