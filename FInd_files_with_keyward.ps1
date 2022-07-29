#Write a Script to Find the Size of the Given folder Files type(only files size)
#Example : Find the size of the E:\abc folder pdf extention file size
Clear-Host
$Drive_name = read-Host "Type a drive name (e.g. C:\) "
if (test-path -Path $Drive_name -PathType Container)
{
    $result = Get-ChildItem -Path $Drive_name -Recurse -File

    for(($i = 0), ($count = 0),($size = 0); $i -lt $result.Length ; $i++)
    {
    if(($result[$i]).Extension -like "*.pdf") 
    {
           <#
            Write-Host Filename : $result[$i].Name
            Write-Host Location : $result[$i].FullName
            Write-Host Size : $result[$i].Length
            Write-Host "============================================="
    #>       
            $count++
            $size+= $result[$i].Length  
        }

    }
Write-Host "Total pdf files found on your given location $Drive_name are" $count -ForegroundColor DarkGreen
$all_size = [Math]:: Round($size/1MB,2)
Write-Host "Total pdf files Size on your given location $Drive_name are" $all_size "Mb"

}
elseif(test-path -Path $Drive_name -PathType Leaf)
{
    Write-Host "You have type a drive name along with file name. Kindly type only Directory name "
}
else 
{
    Write-Host "Invalide Drive name." -ForegroundColor DarkRed
}