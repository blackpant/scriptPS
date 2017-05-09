$body1 = '
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Reports Test Scripts</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://bootswatch.com/yeti/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    

   

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesnt work if you view the page via file:// -->
    <!--[if lt IE 9]>
<#      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>#>
    <![endif]-->
  </head>
  <body>
  <div class="container">'

$scriptPart = '<script>
    $("table").addClass("table table-striped");
</script>'

$scriptint = ' <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
'
$bodyend = '  
</div>
</body>
</html>'

$content = Get-MsolGroup | Select-Object displayname, description | ConvertTo-EnhancedHTMLFragment -TableCssClass "table table-striped table-hover" -As Table -MakeTableDynamic

$content2 = Get-MsolGroup | Select-Object displayname, description | ConvertTo-EnhancedHTMLFragment -TableCssClass "table table-striped table-hover" -As Table -MakeTableDynamic


<#$content = Get-MsolGroup |Select-Object displayname, grouptype, description | ConvertTo-Html -Fragment #>
$html = $body1 + $content + $content2 + $bodyend

$html | Out-File -Encoding utf8 test3.html 


<#$html | Out-Host#>
<#$html | Out-File .\groupTableBis.html#>