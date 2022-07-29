#Write a Program to Monitor a Given Service.
clear-host
while(1)
{
    $srv_status = (Get-Service -name CryptSvc).Status
    if($srv_status -ne "running")
    {
        Write-Host "Cryptographic Services is stopped - Daily job will disrupted" -f Red
        Write-Host " Someone please take care of email" -f Yellow
        sleep 2
        Start-Service -Name CryptSvc -Verbose
        Get-service -name CryptSvc
    }
    else 
    {
        #Write-Host " All Good about Cryptographic Services"
        sleep 1
    }

}
