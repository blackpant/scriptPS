[cmdletbinding()]
Param (
    $ComputerNameVar = ".",
    $EventID = 4624,
    $NumItems = 5 
)

md ".\Logs" -ErrorAction SilentlyContinue

Get-EventLog -LogName Security -ComputerName $ComputerNameVar |
    Where-Object EventID -EQ $EventID |
    Select-Object -First $NumItems |
    Out-File "Logs\EventsLogs.txt"