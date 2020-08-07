$date = Get-Date -Format G

while ($true)
{
    if ((Get-Process -Name DSSearch-server -ErrorAction Stop) -eq $null)
    {

        Write-Host -ForegroundColor Red "Server Is Not Running"
        <#.\DSSearch-server.exe -launcher -dedicated -headless -window -height 300 -width 300#>
        Start-process C:\dsp\DSSearch-server
        "Guardian Started DSSearch Server $($date)" | Add-Content .\searchServer.log 
         <#Start-process C:\dsp\DSSearch-server#>
  

    }
    else
    {
        write-host -ForegroundColor Green "Server Is Running"
    }

    Start-Sleep -Seconds 10
}