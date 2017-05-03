<#Get-Service | Export-Csv Sample.csv -Delimiter ";" #>
$authToken = Get-PBIAuthToken -clientId "291364df-0ae2-490c-a867-bf2629479e19"
$dataSetSchema  = Get-PBIDataSet -authToken $authToken -name "CSVSample"

if (-not $dataSetSchema )
{
  # If cannot find the DataSet create a new one with this schema	
	
  $dataSetSchema = @{
	name = "CSVSample"
	; tables = @(
		@{name = "Processes"
		; columns = @( 
			@{ name = "ComputerName"; dataType = "String"  }					
			, @{ name = "Date"; dataType = "DateTime"  }
			, @{ name = "Hour"; dataType = "String"  }
			, @{ name = "Id"; dataType = "String"  }
			, @{ name = "ProcessName"; dataType = "String"  }
			, @{ name = "CPU"; dataType = "Double"  }
			, @{ name = "Memory"; dataType = "Double"  }
			, @{ name = "Threads"; dataType = "Int64"  }					
			) 
		})
  }	

  $dataSetSchema  = New-PBIDataSet -authToken $authToken -dataSet $dataSetSchema -Verbose
}
else {
    Clear-PBITableRows -authToken $authToken -dataSetId $dataSetSchema.Id -tableName "Counters" -Verbose
        Clear-PBITableRows -authToken $authToken -dataSetId $dataSetSchema.Id -tableName "CountersResume" -Verbose
}

$computers = @($env:COMPUTERNAME)
while ($true) {
    $computers | ForEach-Object {
        $computerName = $_

        $timeStamp = [datetime]::Now

        Get-Process -ComputerName $computerName | Select-Object @{Name = "ComputerName"; e = {$computerName}}`
            		, @{Name="Date"; Expression = {$timeStamp.Date.ToString("yyyy-MM-dd")}} `
		            , @{Name="Hour"; Expression = {$timeStamp.ToString("HH:mm:ss")}} `
		            , Id, ProcessName, CPU, @{Name='Memory';Expression={($_.WorkingSet/1MB)}}, @{Name='Threads';Expression={($_.Threads.Count)}} `
	    | Add-PBITableRows -authToken $authToken -dataSetId $dataSetSchema.Id -tableName "Processes" -batchSize -1 -Verbose

    }

    Start-Sleep -Seconds 10
}
