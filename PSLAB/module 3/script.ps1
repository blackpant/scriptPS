Get-Service -ComputerName (Get-Content Names.txt)
Get-EventLog -LogName Security -ComputerName (Get-ADComputer -Filter * | select -ExpandProperty Name)
