function Get-DiskSpace
{
<#
.SYNOPSIS
    Retreive basic disk capacity from one or more computers
.DESCRIPTION
    This is a simple function that uses CIM to connect to remote computers to get disk capacity information
.PARAMETER ComputerName
One or more computer to query
.PARAMETER LocalOnly
This is to include local disk in the output, and it is the default
To turn it off: 
Get-DiskSpace -ComputerName client -LocalOnly:$False
.EXAMPLE
Get-DiskSpace localhost,client
    This will get the disk space info from 2 computers, "localhost" and "client"
Get-DiskSpace 192.168.1.10
    This will get the disk space info from a computer using its IP address
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>

    [cmdletbinding()]
    param(
    [string[]]$ComputerName,
    [switch]$LocalOnly = $true
    )
    begin{}
    Process{
    foreach ($computer in $ComputerName){
        $params = @{'ComputerName'=$computer;'class'='Win32_LogicalDisk'}
        if ($LocalOnly){
            $params.Add('Filter','DriveType=3')
            }
            Get-CimInstance @params |
            Select-Object @{n='Drive';e={$_.DeviceID}},
                          @{n='Size';e={"{0:N2}" -f ($_.Size/1gb)}},
                          @{n='FreeSpace';e={"{0:N2}" -f ($_.FreeSpace/1gb)}},
                          @{n='FreePercent';e={"{0:N2}" -f ($_.FreeSpace/$_.Size*100)}}
        }
    }
    end{}
}