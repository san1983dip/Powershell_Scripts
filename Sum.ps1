(Get-ChildItem -Path D:\Sandip -Recurse | Measure-Object -Property Length -Sum).sum/1GB
clear-host
$foldername = Read-Host "Type the folder name (kindly specify as C:\temp)" # type foldername based on your wish
$Sum_File=(Get-ChildItem -Path "$foldername"-Recurse | Measure-Object -Property Length -Sum).Sum/1GB #Total size of any folder
Write-Host "Total size of your given folder "$foldername" is (in GB):" $Sum_File

clear-host
$foldername = Read-Host "Type the folder name (kindly specify as C:\temp)" # type foldername based on your wish
$ab=(Get-ChildItem -Path "$foldername" -Recurse -File| Sort-Object -Property Length -Descending| Select-Object -Property Name, Length,Directory -First 1).Name #Top  Big file Name to a given drive
$ac=(Get-ChildItem -Path "$foldername" -Recurse -File| Sort-Object -Property Length -Descending| Select-Object -Property Name, Length,Directory -First 1).Length/1GB #Top  Big file size to a given drive
$ad=(Get-ChildItem -Path "$foldername" -Recurse -File| Sort-Object -Property Length -Descending| Select-Object -Property Name, Length,Directory -First 1).Directory #Top  Big file location to a given drive
Write-Host "The Biggest file of your spcified location ""$foldername"" is :" $ab
Write-Host "The Size of the file ""$ab"" is :" $ac "GB"
Write-Host "The location of the file ""$ab"" is :" $ad 

