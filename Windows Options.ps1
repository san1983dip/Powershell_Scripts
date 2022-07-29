clear-host
while (1) 
{

Write-Host "`t`t`t`t`t  Windows Options `n `t`t`t`t`t =================" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 1> SERVICE `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 2> PATCHES INFORMATION `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 3> DIRECTORY SIZE `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 4> DLETE OF OLD FILES `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 5> STATUS OF WINDOWS UPDATE SERVICE`n`t`t`t`t`t" -ForegroundColor Yellow

[int]$user_input=Read-Host "Type a number between 1-5 "

if ($user_input -eq 1) 
{
    Write-Host "`t`t`t`t`t Welcome to Service command" -ForegroundColor Green
   $service_status = Read-Host "Type the service status as (Running/Stopped) "
   $service_name = Read-Host "Type the Service name with wildcard "
   Get-Service | ? {$_.Status -eq $service_status -and $_.DisplayName -like  $service_name } | Sort-Object -Property StartType | Select-Object -Property Name,Status,StartType,DisplayName
}
if ($user_input -eq 2) 
{
    Write-Host "`t`t`t`t`t Welcome to patch information" -ForegroundColor Green
    [datetime]$from_date = Get-Date (Read-Host  'Enter the start date of the logs, Ex: 17-07-2017 or 17-07-2017 09:00:00')
    [datetime]$to_date = Get-Date (Read-Host  'Enter the start date of the logs, Ex: 17-07-2017 or 17-07-2017 09:00:00')
    Get-HotFix | ? {$_.InstalledOn -ge $from_date -and $_.InstalledOn -le $to_date } | Sort-Object -Property InstalledOn -Descending | Select-Object -First 3 | Select-Object -Property HotFixID,InstalledOn
}
if ($user_input -eq 3) 
{
    Write-Host "`t`t`t`t`t Welcome to Directory Size details" -ForegroundColor Green
    $folder_name = Read-Host "Type the folder name (kindly specify as C:\temp)" 
    $folder_size = (Get-ChildItem -Path $folder_name -Recurse | Measure-Object -Property Length -Sum).Sum/1GB
    Write-Host "Your requested folder "$folder_name" size is :" $folder_size "GB(s)"
}
if ($user_input -eq 4) 
{
    Write-Host "`t`t`t`t`t Delete old ites and free up space" -ForegroundColor Green
    $Item_name = Read-Host "Type the file or folder name "
    [int]$item_age =  Read-Host "Type the days you like "
    $days = Get-ChildItem -Path $Item_name -Recurse | ? ($_.CreationTime -lt (Get-Date).AddDays(-$item_age)) | Remove-Item -Force

    
}
if ($user_input -eq 5) 
{
    Write-Host "`t`t`t`t`t Get the status of Windows update" -ForegroundColor Green
    $update_srv = (Get-Service -Name wuauserv | Select-Object -Property Status).status
    Write-Host "`t`t`t`t`t Windows update service is" $update_srv "to this system." -ForegroundColor Magenta -BackgroundColor White
}
<#
if ($user_input -gt 5 -or $user_input -lt 1) 
{
    Write-Host "`t`t` You have chosen the number outside of the range specified. Kindly select between 1 - 5`t"  -ForegroundColor DarkRed -BackgroundColor White
}#>
Else 
{ 
    Write-Host " You have chosen the number outside of the range specified. Kindly select between 1 - 5"  -ForegroundColor DarkRed -BackgroundColor White
}

[char]$choice = read-host "Do you want continue(y/n)"
if($choice -eq 'y')
{
        continue
}
else
{
        write-host "Thank you for visiting" -f red
        exit
}

}