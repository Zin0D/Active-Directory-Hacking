# Priviliged Access

- `We can move around a Windows Domain by utilizing RDP`
- `Powershell Remoting (WinRM Access)`
    
    [PowerShell remoting - PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/08-powershell-remoting?view=powershell-7.4&viewFallbackFrom=powershell-7.2)
    
- `MSSQL Server.`

There are deffo more out there, i need to see which ones i can include.

<aside>
💡

We need to check for Specific Perms on what we can do.

</aside>

- CanRDP
- CanPSRemote
- SQLAdmin

`There are prolly more.`

To check if a Host can PSRemote or RDP, we need to just check, if he is part of the Remote Man localgroup on a system. We can achieve this by using netlocalgroup command.