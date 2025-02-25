# LLMNR Poisoning

Previously NBT-NS (In older Version)

The Key Flaw is, when Traffic is intercepted in the Network, we can `capture Username and Hashes`

`LLMNR FLAW EXPORSURE`

![image.png](LLMNR%20Poisoning%20152357aeddc08085b774f8589adb1b27/image.png)

<aside>
💡

We will use Responder, in order to do the LLMNR Poisoning Attack

</aside>

![image.png](LLMNR%20Poisoning%20152357aeddc08085b774f8589adb1b27/image%201.png)

- LLMNR Poisoning in Action on.
- `LinkLocalMulticastNameResulotion`
    - `LLMNR` is enabled by default.
    - Windows2025 Server seems worse, Hashes seem to be sent left and right…

![image.png](LLMNR%20Poisoning%20152357aeddc08085b774f8589adb1b27/image%202.png)

[example_hashes    [hashcat wiki]](https://hashcat.net/wiki/doku.php?id=example_hashes)