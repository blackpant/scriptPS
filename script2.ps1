Param (
    $ComputerNameVar = ".",
    $EventID = 4624,
    $NumItems = 5 
)



Get-EventLog -LogName Security -ComputerName $ComputerNameVar |
    Where-Object EventID -EQ $EventID |
    Select-Object -First $NumItems