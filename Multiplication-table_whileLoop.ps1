#Multiplication-table using whileLoop
Clear-Host

[int]$table = Read-Host "Type a table no of your wish "
[int]$max = Read-Host "Type the no, till you want to expand your table " 

 Write-Host `n "Multiplication Table of your given no" $table" is as follows: " -ForegroundColor Green `n
while (1) 
{
    for (($i =0) ; ; $i++) 
    {
        $result = $i * $table
        Write-Host `t`t` $table * $i = $result 
        
        if ($i -ge $max)
         {
          Exit  
        }
    }
}



