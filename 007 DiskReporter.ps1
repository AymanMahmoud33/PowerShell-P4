[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)][string[]]$ComputerName,
    [Parameter(Mandatory=$true)][int]$MinFreeDiskPercent
    )

Get-DiskSpace -ComputerName $ComputerName | 
Where FreePercent -lt $MinFreeDiskPercent |
Select ComputerName,FreePercent,Drive |
ConvertTo-Html | Out-File LowDiskSpace.html

# Send email message function
# could be scheduled task to check disk space
