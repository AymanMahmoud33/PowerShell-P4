$message = ""
$continue = $true

do {
Write-Host "========================================="
Write-Host "             Support Menu                "
Write-Host "========================================="
Write-Host ""

if ($message -ne "")
    {
        Write-Host $message
        Write-Host ""
    }
Write-Host "1. Get Disk Space Info"
Write-Host "2. Get Latest Security Log"
Write-Host "3. Get OS Details"
Write-Host "   (Specify: Logoff, Restart, Shutdown, or PowerOff for Action)"
Write-Host "x. Quit menu"
Write-Host ""
$message = ""
$choice = Read-Host "Select activity"

switch ($choice) 
    {
    1 {Get-DiskSpace | Format-List}
    2 {Get-LatestSecurityLog | Format-Table} 
    3 {Get-OSDetails | Format-List}
    'x' {$continue = $false}
    default { $message = "unknow choice, try again" }
    }
Read-Host " Hit any key to continue" 
Clear-Host
}

while ($continue) {
Write-Host "Exited menu, Goodbye!"
}