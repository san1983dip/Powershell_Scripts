Clear-Host
$a1 = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
$y1 = Get-Date
$z = ($y1- $a1).Days

Write-Host "System is running by $z day's without reboot" -ForegroundColor Green
Write-Host "System was rebooted on $a1" -ForegroundColor Yellow