
clear-host

Select-String  -Pattern "\b((([0-9]|[1-9][0-9]|[1][0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|[1][0-9][0-9]|2[0-4][0-9]|25[0-5]))\b" -Path 'D:\Sandip\Study\Powershell\ipdata.csv' | foreach-object {$_.Matches} | select value | export-csv -Path D:\Sandip\Study\Powershell\data3.csv -NoTypeInformation

$ips = import-csv -Path 'D:\Sandip\Study\Powershell\data3.csv' 

$pr = import-csv -Path 'D:\Sandip\Study\Powershell\ipdata.csv' 

foreach($data in $pr)
{
        for($i=0;$i -lt $ips.Length;$i++)
        {
            
            if($data.ipaddress -match $ips[$i].value)
            {
            write-host 'UserName' $data.Name "`t`t" "IP-Address" $ips[$i].value

            }

        }
}

Get-Process | Where-Object -FilterScript {$_.Handles -ge '100' -and $_.Handles -le '500'}




