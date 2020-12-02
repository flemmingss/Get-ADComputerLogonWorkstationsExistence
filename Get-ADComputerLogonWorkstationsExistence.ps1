<#
.Synopsis
   Name: Get-ADComputerLogonWorkstationsExistence.ps1
   A PowerShell function to list and verify existence of computers in a AD user's LogonWorkstations list
.DESCRIPTION
   If LogonWorkstations list is enabled on a AD User, this function will list all workstations and check if the computers exist.
.EXAMPLE
   Get-ADComputerLogonWorkstationsExistence -User *Username*
.NOTES
   Original release Date: 02.12.2020
   Author: Flemming Sørvollen Skaret (https://github.com/flemmingss/)
.LINK
   https://github.com/flemmingss/
#>

function Get-ADComputerLogonWorkstationsExistence
{
    Param(
    [Parameter(Mandatory=$true)]
    [string]$User
    )

    try
    {

        $computers = (Get-ADUser -Identity $User -Properties LogonWorkstations).LogonWorkstations.split(",")

        foreach ($computer in $computers)
        {
            try
            {
                Get-ADComputer $computer -ErrorAction Stop | Out-Null
                Write-Host "$($computer) found in AD" -ForegroundColor Green
            }

            catch
            {
                Write-Host "$($computer) not found in AD" -ForegroundColor Red
            }

        }

    }

    catch
    {
    
        try
        {
            Get-ADUser $User -ErrorAction Stop | Out-Null
            Write-Host "There are no workstation logon restrictions for this user ($User)"
        }

        catch
        {
            Write-Host "Can't find user ($User) in AD."
        }

    }
}
