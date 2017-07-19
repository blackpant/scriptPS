<# Start an interactive session 

#>
<# Get-EventLog -LogName System -Newest 100 | Group-Object -Property Source #>
# Get-Service | Where-Object Status -eq "Stopped" | Format-Table -Wrap | Out-File "Process.txt"
# Get-Service | Where-Object Status -eq "Stopped" |  Select-Object Name, DisplayName
# Get-Process | Sort-Object Id | Select-Object ProcessName, Id -First 10
# Get-Process | Sort-Object ProcessName | Select-Object -First 10
# Get-Process | Get-Member | Where-Object -Property MemberType -EQ "Property" | Select-Object Name, MemberType

#A calculated Property using the @{}
# Get-Process | Select-Object Name, @{n='Pageable Memory (MB)'; e={$PSItem.PM / 1MB}} -First 10 

# using -f for formatting operator. {0:N2}, 0 means to display a number and N2 means with  two decimal places.
# See 'Help About_Operators' in PowerShell.
# Get-Process | Select-Object Name, @{n='Pageable Memory (MB)'; e={'{0:N2}' -f ($PSItem.PM / 1MB)}} -First 10 

# Use of multiple critaria and True/False
# Get-Process | Where-Object {$PSItem.CPU -gt 30 -or $PSItem.VirtualMemorySize -lt 10000}

# Get-Process | Where-Object {$_.Responding -eq $false}

# Get-Process | Where-Object {$_.Responding}

# 1..10 | ForEach-Object {$PSItem.ToString();Get-Random}

# 1..10 | ForEach-Object {Get-Random}


# Get-NetFirewallRule -Enabled True | Select-Object DisplayName, Profiles, Direction,Action -First 10 | Sort-Object DisplayName

# Get-NetNeighbor |Where-Object IPAddress -like "*.*" |Select-Object IPAddress,State | Sort-Object State

# Get-Process | Select-Object Id, ProcessName, VM, PM | Sort-Object ProcessName -Descending | ConvertTo-Html | Out-File ProcReport.html

# Get-EventLog System | Select-Object -First 10 | Export-Csv SysEvents.csv -Delimiter ";"

# Get-Service | Select-Object Name, DisplayName, Status | Sort-Object Status -Descending | Export-Clixml ServicesBis.xml

# New-PSDrive -Name WINDIR -Root C:\Windows -PSProvider FileSystem
# Get-ChildItem -Path Windir:\
# New-PSDrive -Name WINDIR -Root C:\Windows -PSProvider FileSystem


#Get-ChildItem HKCU:\SOFTWARE\c*
#New-Item -Path HKCU:\SOFTWARE -Name Classroom
#Get-ChildItem HKCU:\SOFT*\c* 
#New-ItemProperty -Path HKCU:\SOFTWARE\Classroom -Name Test -Value 1
#Remove-Item HKCU:\SOFTWARE\Classroom

<#New-PSDrive -Name Output -PSProvider FileSystem -Root C:\Windows
Get-PSDrive
Remove-PSDrive -Name Output
Get-PSDrive #>
#------------------------------------------------------------------
#New-Item -ItemType Directory C:\ScriptOutput
#Remove-Item C:\ScriptOutput
#------------------------------------------------------------------
# Get-PSDrive
# New-Item -Name Scripts -Path HKCU:\SOFTWARE
# Get-Item -Path HKCU:\SOFTWARE\s*
# Remove-Item -Path HKCU:\SOFTWARE\Scripts
# Get-Item -Path HKCU:\SOFTWARE\s*

# Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
# Get-Help New-ItemProperty -ShowWindow
# New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name 'Windows PowerShell' -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
# Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
# Remove-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name 'Windows PowerShell'

# Get-Service | Where-Object Status -EQ Running
# Get-Service | Where-Object -FilterScript {$_.Status -eq 'Running'}
# Get-Service | Where-Object -FilterScript {$_.Name.Length -gt 20}

#Get-Process | Where-Object HandleCount -GT 100
#Get-Process | Where-Object HandleCount -LT 100
#Get-Process | Sort-Object HandleCount | Select-Object ProcessName, HandleCount
#Get-Process | Where-Object  HandleCount -EQ 0
#Get-Process | Where-Object ProcessName -Like "win*"
#Get-Process | Where-Object ProcessName -NotLike "win*"
# Get-Process | Where-Object -FilterScript {$_.Name -notlike "win*" -and $_.Handles -gt 100}
# gps | ? -FilterScript {$_.Name -notlike "win*" -and $_.Handles -gt 100}

# Get-Process | Format-Wide -Column 5
#Liste avec plusieurs colonnes, exemple de sorti :
#---------------------------------------------------------------------------------- 
# Code              Code             Code             Code             Code            
# conhost           conhost          conhost          conhost          conhost         
# csrss             csrss            dasHost          DataExchangeHost dllhost         
# DW20              dwm              esif_assist_64   esif_uf          EXCEL           
# explorer          FileCoAuth       fontdrvhost      googledrivesync    
# --------------------------------------------------------------------------------
# Get-Process |Select-Object -First 10|`
# Format-Table -Property Name, Id, `
# @{n='VM(MB)';`
#     e={$PSItem.VM / 1MB};`
#     formatstring='N2';`
#     align='right'} `
#     -AutoSize 

<#    Get-CimInstance -ClassName Win32_LogicalDisk |`
    Where-Object DeviceID -EQ 'C:' |`
    Format-Table -Property DeviceID, `
        @{n = 'FreeSpace (GB)'; `
            e = {$PSItem.FreeSpace / 1GB}; `
            formatstring = 'N2'`
        
    }, `
        @{n = 'Size(GB)'; `
            e = {$PSItem.Size / 1GB}; `
            formatstring = 'N2'`
        
    }, `
        @{n = 'Type'; e = {$PSItem.Description}; width = 5}`:w
        
        -AutoSize
#>
# Get-Service |Sort-Object Status | Format-List -GroupBy Status 

# Get-Process | Select-Object -Property Name, Id | Get-Member
# Get-Process | Format-Table -Property Name,Id -AutoSize -Wrap |Out-File  .\testcoucou.csv 
# Get-Process  | Out-GridView
# Get-EventLog -LogName Security | Where-Object -FilterScript { $_.EventID -eq 4624} | Select-Object EventID, TimeWritten, Message | ConvertTo-Html | Out-File .\EventReport.html
# Get-ChildItem -Path CERT: -Recurse | gm
# Get-ChildItem -Path CERT: -Recurse | Where-Object {$_.HasPrivateKey -eq 'false'}
# Get-ChildItem -Path CERT: -Recurse | Where-Object {$_.NotBefore -lt (Get-Date) -and $_.NotAfter -gt (Get-Date) -and $_.HasPrivateKey -eq $false} | Select-Object NotBefore, NotAfter, Issuer

# Get-Volume | where { $PSItem.SizeRemaining -gt 0 -and $PSItem.SizeRemaining / $PSItem.Size -lt 0.1}

# Get-ControlPanelItem -Category 'Syst�me et s�curit�'

# Get-Process | Format-Table -Property ProcessName, Id, VM, PM -AutoSize

# Get-NetRoute | Format-Table -Property AddressFamily, RouteMetric, TypeOfRoute, DestinationPrefix -GroupBy AddressFamily -AutoSize -HideTableHeaders

# Set-Location C:\Users\aurera\Downloads
# Get-ChildItem *.exe | Sort-Object -Property Length -Descending| Format-Table -Property Name, @{n="Size(KB)";e={$PSItem.Length/1KB};formatstring="N2"} -AutoSize

Get-EventLog Security -Newest 10 | Select-Object EventID, TimeGenerated, TimeWritten, @{n="Time Delay";e={$PSItem.TimeGenerated - $PSItem.TimeWritten}} | Sort-Object -Property 'Time Delay'|Format-Table EventID, 'Time Delay' -AutoSize


Get-Service BITS | Stop-Service

Import-Csv computers.csv | Get-Service

<# Passing data ByPropertyName #>
<#
name.csv
"Name"
"BITS"
"WinRM"
#>

Import-Csv Name.csv | Get-Service

Import-Csv computers.csv | Get-Member
Import-Csv computers.csv | Get-Service -Name BITS, WinRM

<#---------------------------------------------------------------------------------------------------------------#>

<#
Parenthtical commands
-ExpendProperties
#>
