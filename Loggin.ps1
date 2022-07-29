Clear-Host
[string]$tt = (Get-WMIObject -ClassName Win32_ComputerSystem).Username
Write-Host " Currently logged in user's are as follows ""$tt""" -ForegroundColor Yellow
