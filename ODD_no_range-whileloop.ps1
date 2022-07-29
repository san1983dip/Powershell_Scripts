clear-host
#Find odd numbers of a given range using while loop
[int] $first = read-host "Type start no " 
[int] $last = read-host "Type end no " 
Write-Host `n "Odd numbers between $first and $last are as follows: " -ForegroundColor DarkGreen
while(1)
{
    for ($i = $first ;    ; $i++ ) 
    {
    if ($i %2 -eq 1) 
    {
         $i
    }
    if ($i -eq $last) 
    {
    Exit    
    }
}

}