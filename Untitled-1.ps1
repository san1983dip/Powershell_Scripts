Get-Process | Where-Object -FilterScript {$_.Handles -ge '100' -and $_.Handles -le '500'} | Select-Object -First 1 | Format-List -Property *
Get-Process | Select-Object -Property ProcessName,ID,CPU | Sort-Object -Property CPU -Descending
Get-Process | Select-Object -Property ProcessName,ID,CPU | Sort-Object -Property CPU -Descending | select -First 5
Get-Process | Sort-Object -Descending
Get-Process | Sort-Object -Property CPU -Descending | select -First 5
Get-Process | Sort-Object -Property PagedMemorySize -Descending | select -First 5
Get-Process | Select-Object -Property ProcessName,ID, | Sort-Object -Property CPU -Descending | select -First 5
Get-Service | ? -FilterScript {$_.StartType -eq 'Automatic' -and $_.DisplayName -notlike '*service'} | Select-Object -Property Name,DisplayName,StartType
Get-EventLog -LogName Application | ? -FilterScript {$_.EntryType -eq 'warning' -and $_.TimeWritten -ge '18 Feb 2022 12.00.00 AM' -and $_.TimeWritten -le '18 Feb 2022 11.59.59 PM'}
Get-HotFix | ? -FilterScript {$_.InstalledOn -ge '01 Jan 2022 12.00.00 AM' -and $_.InstalledOn -le '18 Feb 2022 11.59.59 PM'}
Get-Service | ? -FilterScript {$_.Status -notcontains 'running'}2)	Create a Script find the sum of two number (with help of NOTEPAD)
Answer à
[int32]$aa = read-Host "Type a number"
[int32]$bb = read-Host "Type anothr number"
$cc = write-host The Product of "$aa " and "$bb" is : ($aa+$bb)

Get-Service | ? -FilterScript {$_.Status -notin 'running'}
(Get-date).adddays(-30)
Get-ChildItem -Path D:\ -Recurse -File | ? -FilterScript {$_.CreationTime -lt (Get-date).adddays(-30)}
Get-ExecutionPolicy
Set-ExecutionPolicy -
Get-service | ? {($_.status -eq 'running') -xor ($_.Name -like 'W*')}
Get-service | ? {($_.status -eq 'stopped') -xor ($_.Name -like 'W*')}
Get-service | ? {($_.status -eq 'running') -xor ($_.StartType -like 'Manual')}
Get-Service | ? -FilterScript {-Not($_.Status -eq 'running')} # use of not
New-Item -Path 'd:\test11\test.txt' -ItemType File 1>> aa.txt 2>>bb.txt 3>>cc.txt 4>>dd.txt # output stored on aa file as it's a success
Remove-Item -Path 'd:\test11'-Verbose 1>> aa.txt 2>>bb.txt 3>>cc.txt 4>>dd.txt # output stored on dd file as it's an action and we enabled verbose
Remove-Item -Path 'd:\test11\testt.txt'-Verbose 1>> aa.txt 2>>bb.txt 3>>cc.txt 4>>dd.txt # output stored on bb file as it's an error
Get-ChildItem | ? {$_.Name -eq 'test11'} | Remove-Item  -Verbose 1>> d:\a.txt 2>> d:\b.txt 3>> d:\c.txt 4>> d:\f.txt
New-Item -Path 'd:\test11' -ItemType Directory -Verbose 1>> d:\a.txt 2>> d:\b.txt 3>> d:\c.txt 4>> d:\f.txt
New-Item -Path 'd:\test11' -ItemType Directory # create folder
Get-ChildItem | ? {$_.Name -like '*.txt' -and $_.Name -notlike 'b*.txt'} | Remove-Item # delete selective files
Get-Service -Name winrmmm 2>&1>> d:\ddd.txt 
#===============================================================================
$foldername = Read-Host "Type the folder name (kindly specify as C:\temp)" # type foldername based on your wish
Get-ChildItem -Path "$foldername"-Recurse -Directory | Measure-Object #Script to Find the Size of the Given Folder
#===============================================================================
Get-ChildItem -Path "D:\" -Recurse -File| Sort-Object -Property Length -Descending| Select-Object -Property Name, Length,Directory -First 1 # Top 5 Big files in size to a Drive
#===============================================================================
$foldername = Read-Host "Type the folder name (kindly specify as C:\temp)" #specify the location you want find
Get-ChildItem -Path "$foldername" -Recurse -File| Sort-Object -Property Length -Descending| Select-Object -Property Name, Length,Directory -First 5

2)	Create a Script find the sum of two number (with help of NOTEPAD)
Answer à
[int32]$aa = read-Host "Type a number"
[int32]$bb = read-Host "Type anothr number"
$cc = write-host The Product of "$aa " and "$bb" is : ($aa+$bb)
Get-ComputerInfo | Select-Object -Property "OsLastBootUpTime"