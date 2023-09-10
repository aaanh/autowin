Write-Host "Installing Python..."
Start-Sleep -Seconds 2

$uri = "https://www.python.org/ftp/python/3.11.5/python-3.11.5.exe"
$optionsFile = ".\python.unattended.xml"

$installerOptions = [xml](Get-Content $optionsFile)

$cmdArgs = @(
  "/qn",
  "/norestart",
  "InstallAllUsers=" + $installerOptions.Options.InstallAllUsers,
  "TargetDir=" + $installerOptions.Options.TargetDir
)

Invoke-WebRequest -UseBasicParsing -uri $uri -OutFile $env:TEMP\python.exe

Start-Process