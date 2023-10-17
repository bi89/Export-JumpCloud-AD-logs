<#
  By Suchathit Boonnag
  suchathit.root@gmail.com
#>

$time = Get-Date -UFormat "%B_%d_%Y_%T" | ForEach-Object { $_ -replace ":", "-" }  2> $null
$comname = (Get-ComputerInfo | select CsDNSHostName).CsDNSHostName

New-Item -Path "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time" -ItemType Directory
Copy-Item -Path "C:\Windows\Temp\JumpCloud_AD_Integration.log" -Destination "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time"
Copy-Item -Path "C:\Program Files\JumpCloud\AD Sync\adsync.log" -Destination "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time"
Copy-Item -Path "C:\Program Files\JumpCloud AD Bridge\adint.config.json" -Destination "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time"

Compress-Archive -Path "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time" -DestinationPath "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time.zip"
Move-Item -Path "C:\Windows\Temp\JumpCloud-AD-Log-$comname-$time.zip" -Destination "$([Environment]::GetFolderPath('Desktop'))\JumpCloud-AD-Log-$comname-$time.zip"