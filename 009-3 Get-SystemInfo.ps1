function Get-SystemInfo {
    [cmdletbinding()]
 param(
    [Parameter(Mandatory=$true)]
    [string[]]$ComputerName
    )
    Process {
            foreach($Computer in $ComputerName) 
                {
                Write-Verbose "Querying $Computer"
                $os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName
                $proc = Get-CimInstance -ClassName Win32_Processor -ComputerName $Computer
                $bios = Get-CimInstance -ClassName Win32_BIOS -ComputerName $Computer


                if ($os.OSArchitecture -ne $proc.AddressWidth)
                    {
                        $optimal = $false
                    } else {
                        $optimal = $true
                    }
                $props = @{
                    ComputerName = $computer;
                    OSVersion = $os.Version;
                    SPVersion = $os.ServicePackMajorVersion;
                    OSArchitecture = $os.OSArchitecture;
                    ProcArchitecture = $proc.AddressWidth;
                    BIOSSerial = $bios.SerialNumber;
                    OptimalArchitecture=$optimal
                    }
                $obj = New-Object -TypeName pscustomobject -Property $props
                
                Write-Output $obj
                }
            }
}
Get-SystemInfo -ComputerName localhost -Verbose -Debug