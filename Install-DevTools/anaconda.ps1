Write-Host "Installing Anaconda..."
Start-Sleep -Seconds 2

Invoke-WebRequest https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Windows-x86_64.exe -OutFile $env:TEMP\Anaconda3-latest-Windows-x86_64.exe

Start-Process /wait "" Anaconda3-latest-Windows-x86_64.exe /InstallationType=JustMe /RegisterPython=1 /S /D=%UserProfile%\Anaconda3