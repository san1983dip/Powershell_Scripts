# Write a Program to Print the Factors of the Given number.
Clear-Host
[int]$start = read-Host "Type a number to get the factor "

for ( ($i = 1) ; $i -le $start ; $i++ ) 
{
    if($start % $i -eq 0) 
    {
         #$y = $i
         Write-Host "Factor of $start are " $i  
    }

}