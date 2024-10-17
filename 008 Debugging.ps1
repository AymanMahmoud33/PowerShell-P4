function Get-DiskSpace
{

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
            $params.Add('Filter','DriveType=fixed')
            }
            Get-CimInstance @params |
            Select-Object @{n='Drive';e={$_.DeviceID}},
                          @{n='Size';e={"{0:N2}" -f ($_.Size/1gb)}},
                          @{n='FreeSpace';e={"{0:N2}" -f ($_.FreeSpace/1gb)}},
                          @{n='FreePercent';e={"{0:N2}" -f ($_.FreeSpace/$_.Space*100)}}
        }
    
    end{}
}
}