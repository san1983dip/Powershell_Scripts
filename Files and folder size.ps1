Clear-Host
$folder_name = Read-Host "Type the folder name (kindly specify as C:\temp)" 
$folder_size = (Get-ChildItem -Path $folder_name -Recurse | Measure-Object -Property Length -Sum).Sum/1GB #find folder size in GB
Write-Host "Your requested folder "$folder_name" size is " $folder_size "GB(s)"

$folder_size = (Get-ChildItem -Path $folder_name -Recurse | Measure-Object -Property Length -Sum).Sum/1MB #find folder size in MB