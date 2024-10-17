function Get-LatestSecurityLog
{
 param(
    [Parameter(Mandatory=$true)]
    [string]$ComputerName
 )

 Get-WinEvent -LogName Security -MaxEvents 10 -ComputerName $ComputerName
}

function Get-OSDetails
{
 param(
    [Parameter(Mandatory=$true)]
    [string]$ComputerName
 )

 Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName
}


function Get-DiskSpace
{

    [cmdletbinding()]
    param(
    [Parameter(Mandatory=$true)]
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
            Select-Object @{n='ComputerName';e={$_.PSComputerName}},
                          @{n='Drive';e={$_.DeviceID}},
                          @{n='Size';e={"{0:N2}" -f ($_.Size/1gb)}},
                          @{n='FreeSpace';e={"{0:N2}" -f ($_.FreeSpace/1gb)}},
                          @{n='FreePercent';e={"{0:N2}" -f ($_.FreeSpace/$_.Size*100)}}
        }
    }
    end{}
}