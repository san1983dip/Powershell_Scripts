Clear-Host
$Item_name = Read-Host "Type the file or folder name "
$item_age = (Get-ChildItem -Path $Item_name).CreationTime # grouping done
$today_date=Get-Date # most important 
Write-Host "The file ""$Item_name"" created on" ($today_date - $item_age).Days "Days's before"
