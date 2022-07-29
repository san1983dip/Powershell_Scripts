#Multiplication table using for loop
Clear-Host
function multiplicatoion_table
{
$x = Read-Host "Type a table no of your wish "

for (($i =0) ; $i -le 10 ; $i++) 
{
    $y = $i * $x
    Write-Host $x * $i = $y 
    
}
}

multiplicatoion_table