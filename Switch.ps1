
# Example of Switch given below
clear-host

while (1) 
{
    
Write-Host "`t`t`t`t`t  Windows Options `n `t`t`t`t`t =================" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 1> SERVICE `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 2> PATCHES INFORMATION `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 3> DIRECTORY SIZE `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 4> AGE OF ANY FILE `n`t`t`t`t`t" -ForegroundColor Yellow
Write-Host "`t`t`t`t`t 5> STATUS OF WINDOWS UPDATE SERVICE`n`t`t`t`t`t" -ForegroundColor Yellow

[int]$user_input=Read-Host "Type a number between 1-5 "

switch ($user_input) 
{
1  {Write-Host "`t`t`t`t`t Welcome to Service command" -ForegroundColor Green
   $service_status = Read-Host "Type the service status as (Running/Stopped) "
   $service_name = Read-Host "Type the Service name with wildcard "
   Get-Service | ? {$_.Status -eq $service_status -and $_.DisplayName -like  $service_name } | Sort-Object -Property StartType | Select-Object -Property Name,Status,StartType,DisplayName}

2   {Write-Host "`t`t`t`t`t Welcome to patch information" -ForegroundColor Green
    [datetime]$from_date = Get-Date (Read-Host  'Enter the start date of the logs, Ex: 17-07-2017 or 17-07-2017 09:00:00')
    [datetime]$to_date = Get-Date (Read-Host  'Enter the start date of the logs, Ex: 17-07-2017 or 17-07-2017 09:00:00')
    Get-HotFix | ? {$_.InstalledOn -ge $from_date -and $_.InstalledOn -le $to_date } | Sort-Object -Property InstalledOn -Descending | Select-Object -Property HotFixID,InstalledOn}

3   {Write-Host "`t`t`t`t`t Welcome to Directory Size details" -ForegroundColor Green
    $folder_name = Read-Host "Type the folder name (kindly specify as C:\temp)" 
    [int]$folder_size = (Get-ChildItem -Path $folder_name -Recurse | Measure-Object -Property Length -Sum).Sum/1GB
    Write-Host "Your requested folder "$folder_name" size is :" $folder_size "GB(s)" }

4   {Write-Host "`t`t`t`t`t Delete old ites and free up space" -ForegroundColor Green
    $Item_name = Read-Host "Type the file or folder name "
    $item_age = (Get-ChildItem -Path $Item_name).CreationTime # grouping done
    $today_date=Get-Date # most importent 
    #$result_day = ($today_date - $item_age).Days
    #Write-Host "The file ""$Item_name"" created on" $result_day "Days's before"
    Write-Host "The file ""$Item_name"" created on" ($today_date - $item_age).Days "Days's before" }

5   {Write-Host "`t`t`t`t`t Get the status of Windows update" -ForegroundColor Green
    $update_srv = (Get-Service -Name wuauserv | Select-Object -Property Status).status
    Write-Host "`t`t`t`t`t Windows update service is" $update_srv "to this system." -ForegroundColor Magenta -BackgroundColor White }

}
default
{
    write-host "Invalid Option $option" -f red
}

[char] $choise = read-host "Do you want to continue (y/n) "
if($choise -eq "y")
{
    continue
}
else {
    Write-Host "Good Bye" -ForegroundColor Green
    exit
}


}