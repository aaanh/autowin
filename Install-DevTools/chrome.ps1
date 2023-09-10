Write-Host "Installing Chrome..."
Start-Sleep -Seconds 2

# Download Chrome installer to tempdir
Invoke-WebRequest -UseBasicParsing -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $env:TEMP\chrome_installer.exe
# Install Chrome
Start-Process -FilePath $env:TEMP\chrome_installer.exe -Args "/silent /install" -Verb RunAs -Wait