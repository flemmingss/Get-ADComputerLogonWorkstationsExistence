# Get-ADComputerLogonWorkstationsExistence
A PowerShell function to list and verify existence of computers in a AD user's LogonWorkstations list

**Description**  
 If LogonWorkstations list is enabled on a AD User, this function will list all workstations and check if the computers exist.
   
**Requirements**
* Windows PowerShell (tested on v5)
* ActiveDirectory PowerShell Module

  https://docs.microsoft.com/en-us/powershell/module/addsadministration/
  
**Instructions**

Load function:
```powershell
Import-Module .\Get-ADComputerLogonWorkstationsExistence.ps1
```

Run function:
```powershell
Get-ADComputerLogonWorkstationsExistence -User *Username*
```

**Changelog**  
* 02.12.2020
    * Release
