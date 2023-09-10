Write-Host "Installing node version manager (nvm)..."
Start-Sleep -Seconds 2

$assets_url = (ConvertFrom-Json(invoke-webrequest -uri "https://api.github.com/repos/coreybutler/nvm-windows/releases/latest").Content).assets_url
$installer_url = (ConvertFrom-Json(invoke-webrequest -uri $assets_url).Content)[2].browser_download_url

Invoke-WebRequest -UseBasicParsing -uri $installer_url -OutFile $env:TEMP\nvm.exe

Start-Process -Wait "$env:TEMP\nvm.exe" -ArgumentList /silent, /mergetasks=!runcode
