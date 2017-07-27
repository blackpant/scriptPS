<#
.SYNOPSIS
    Short description of this example script2
.DESCRIPTION
    Nothing special to say beside nothing.
.parameter computernamevar
    computer
.parameter eventid
    event ID
.parameter numitems
    number of items to display.
.EXAMPLE
    Another example of how to use this cmdlet
.INPUTS
    Inputs to this cmdlet (if any)
.OUTPUTS
    Output from this cmdlet (if any)
.NOTES
    General notes
.COMPONENT
    The component this cmdlet belongs to
.ROLE
    The role this cmdlet belongs to
.FUNCTIONALITY
    The functionality that best describes this cmdlet
#>

[cmdletbinding()]
Param (
    $ComputerNameVar = ".",
    $EventID = 4624,
    $NumItems = 5 
)


Get-EventLog -LogName Security -ComputerName $ComputerNameVar |
    Where-Object EventID -EQ $EventID |
    Select-Object -First $NumItems