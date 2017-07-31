[cmdletbinding()]
Param (
    $ComputerNameVar = ".",
    $EventID = 4624,
    $NumItems = 5 
)

try {
    mkdir "Logs" -ErrorAction Stop
}
catch {
    Write-Verbose "Folder Already Exists."
}

Get-EventLog -LogName Security -ComputerName $ComputerNameVar |
    Where-Object EventID -EQ $EventID |
    Select-Object -First $NumItems