# Write a Program to delete the 30 older files in the Given Directory.

[string]$Item_name = Read-Host "Type the file or folder name "
[int]$item_age =  Read-Host "Type the days you like "
Get-ChildItem -Path $Item_name -Recurse | ? {$_.CreationTime -lt (Get-Date).AddDays(-$item_age)} | Remove-Item -Force