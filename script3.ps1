$drive = Get-CimInstance -ClassName Win32_LogicalDisk
switch ($drive.DriveType) {
    3 { Write "Fixed local"}
    5 {Write "Optical"}
    Default {write "Other"}
}

