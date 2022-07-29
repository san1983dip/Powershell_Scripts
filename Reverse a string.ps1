#Write a Script to print given string in the reverse order

clear-host
$arr = read-Host "write something of your choise like "
$arr = $arr[($arr.Length - 1)..0] -join ""
Write-Host "Reverse of your given input is " $arr -ForegroundColor Yellow