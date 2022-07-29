function get-details
{
param(
        
        [parameter(ParameterSetName="service")]
        [ValidateSet("running","stopped")]
        [string]$srv_status,


        [parameter(ParameterSetName="service")]
        [SupportsWildcards()]
        [string]$display_name,

        

        [parameter(ParameterSetName="Process")]
        [double]$upper,

        [parameter(ParameterSetName="Process")]
        [double]$lower,
        [string]$username = $env:USERNAME

)
        clear-host
         sleep 2
         $PSCmdlet |fl *
         Sleep 2

        switch($PSCmdlet.ParameterSetName)
        {

        "service"{
                    Get-Service | ?{$_.Status -eq $srv_status -and $_.DisplayName -like $display_name} | ft
                    Write-Host "initiated by $username"


                    }
        "Process" {
                Get-Process | ? {$_.handles -gt $upper -and $_.Handles -lt $lower } |ft
                  write-host executed by $user_name
                        
                 }
         Default{
                     write-host "Something went wrong"
                      write-host executed by $env:USERNAME
                }
        
        }


}