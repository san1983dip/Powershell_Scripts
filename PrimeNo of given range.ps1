#Prime no of given range
clear-host
[int]$first = read-host "Enter the starting number"  #10
[int]$end  = read-host "Enter the Ending number" #20

$count++
$x= 0
for( ; $first -le $end ; $first++  )
{
        
            for($i = 1; $i -le $first ; $i++)
            {
            
                        if($first%$i -eq 0)
                        {
                                $count++
                        }

                        if($i -eq $first)
                        {

                                if($count -ge 3)
                                {
                                        
                                        $count = 0
                                }
                                elseif($count -eq 2)
                                {
                                    $first
                                    $x++
                                }
                        }
                        


            }
            


}


write-host "Total prime Numbers $x" -f Magenta
