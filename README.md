# Active Directory ACL Enumeration Scripts

This repository contains a set of PowerShell scripts designed for **enumerating Active Directory (AD) objects**, focusing on user, group, and access control list (ACL) enumeration. These scripts are ideal for security auditing and penetration testing, offering multiple ways to gather crucial information from your AD environment.

## Scripts Overview

### `ACLEnumeration.ps1`  
This script is **fast** and **recursive**, providing a quick way to enumerate ACLs for AD objects. It's designed for speed and efficiency, ensuring rapid enumeration across the domain.

### `ACLEasyEnum.ps1`  
`ACLEasyEnum.ps1` is built for enumerating **group memberships** and associated ACLs. It may take longer to run, as it leverages **PowerView features** for more detailed group information, making it more comprehensive but slower.

### `ACLEnumViaPowershell.ps1`  
If the **Active Directory module** is not installed, this script provides an alternative to enumerate ACLs using basic PowerShell cmdlets. However, it takes longer to run compared to the other scripts since it doesn't rely on the AD module but aswell, PowerView.

### PowerShell Version 2  
All scripts leverage **PowerShell version 2** to **evade logging** (as logging was introduced in PowerShell v3). This helps prevent logs from being generated during script execution, offering a stealthier approach for auditing. Additionally, the scripts ensure that **PowerShell history is deleted** after usage for further discretion.

## Updates
I will keep updating this repository with more Scripts to enumerate and attack :)

## Ethical Usage
**These scripts should only be used for ethical purposes, such as security auditing, penetration testing, and within environments where you have explicit authorization. Unauthorized access to computer systems is illegal and unethical.**
