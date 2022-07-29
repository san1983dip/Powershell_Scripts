Get-ChildItem -Path D:\Sandip | Select-Object -First 1 | Format-List -Property * ## commad to find the Properties 
Clear-Host
$Item_name = Read-Host "Type the file or folder name "
$item_age = (Get-ChildItem -Path $Item_name).CreationTime # grouping done
$today_date=Get-Date # most importent 
Write-Host "The file ""$Item_name"" created on" ($today_date - $item_age).Days "Days's before"
#$result_day = ($today_date - $item_age).Days
#Write-Host "The file ""$Item_name"" created on" $result_day "Days's before"

Get-ChildItem -Path D:\Sandip | Select-Object -Property Name,CreationTime