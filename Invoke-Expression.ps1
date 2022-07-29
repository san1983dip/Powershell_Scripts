
#Invoke-Expression --> The Invoke-Expression cmdlet evaluates or runs a specified string as a command and returns the results of the expression or command.
# Invoke-Expression or & will share same output
function Get-output
{
    [string]$Global:cmd = Read-Host "Enter the cmdlet "
    
    Invoke-Expression ($cmd) | select -First 5 | ft

}
Clear-Host
Get-output