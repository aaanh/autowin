# 1. Hide Windows 10 search bar using Registry
Write-Host "Hiding Search Bar..."

Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0

# 2. Disable Weather and News on the Windows 10 search bar using Registry
Write-Host "Disabling News and Interests..."

Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2

# 3. Install Google Chrome
Write-Host "Now installing Chrome"
# Download Chrome installer to tempdir
Invoke-WebRequest -Uri "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $env:TEMP\chrome_installer.exe
# Install Chrome
Start-Process -FilePath $env:TEMP\chrome_installer.exe -Args "/silent /install" -Verb RunAs -Wait

# 4. Enable optional features
$win_features = "HypervisorPlatform","VirtualMachinePlatform","Microsoft-Windows-Subsystem-Linux","Microsoft-Hyper-V-All","Microsoft-Hyper-V","Microsoft-Hyper-V-Tools-All","Microsoft-Hyper-V-Management-Powershell","Microsoft-Hyper-V-Hypervisor","Microsoft-Hyper-V-Services","Microsoft-Hyper-V-Management-Clients"

ForEach ($0 in $win_features) {
  Write-Host "Now installing $0..."
  dism /online /enable-feature /featurename:$0 /All /NoRestart
}

# 5. Install dev tools
# Visual Studio Code
& "$PSScriptRoot\Install-DevTools\vscode.ps1"
# Git
& "$PSScriptRoot\Install-DevTools\git.ps1"
# Node Version Manager
& "$PSScriptRoot\Install-DevTools\nvm.ps1"

