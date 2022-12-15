Write-Host "Installing Visual Studio Code..."
Start-Sleep -Seconds 2

$uri = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"

Invoke-WebRequest -uri $uri -OutFile $env:TEMP\code.exe

Start-Process -Wait "$env:TEMP\code.exe" -ArgumentList /silent, /mergetasks=!runcode