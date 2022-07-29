clear-host
[int32]$num = Read-Host "Type some positive no"
$res1 = ( $num % 2)

if ($res1 -eq 0)
{
    Write-Host "You input $num is an EVEN number" -f Green

}
if ($res1 -ne 0)
{
    Write-Host "You input $num is an ODD number" -f DarkRed

}