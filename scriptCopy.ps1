#Get-EventLog -LogName System -Newest 10 | ConvertTo-Csv -Delimiter "," | Out-File SysEvents.csv

#Get-Service | Sort-Object -Descending Status | Select-Object Name, DisplayName, Status | Export-Clixml Service.xml

<# Get-EventLog -LogName Security -Newest 20 | Select-Object EventID, TimeWritten, Message | ConvertTo-Csv -Delimiter "|" | Out-File Security.pdd #>

Get-EventLog -LogName Security 4624 | Select-Object TimeWritten, EventID, Message | ConvertTo-Html html | Out-File EventReport.html
