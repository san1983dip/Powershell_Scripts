clear-host
write-host "`t`t`t`t Welcome to Powershel`t`t`t`t`n`t`t`t`t========================"
[int32]$aa = read-Host "Type First number"
[int32]$bb = read-Host "Type Second number"
#write-host Addition of "$aa" and "$bb"  is :  ($aa+$bb)
write-host "Addition of "$aa" and "$bb"  is" :  ($aa+$bb) -ForegroundColor Blue -BackgroundColor White