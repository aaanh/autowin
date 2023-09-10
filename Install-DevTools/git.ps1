# !!stolen from https://stackoverflow.com/questions/46731433/how-to-download-and-install-git-client-for-window-using-powershell

Write-Host "Installing git..."
Start-Sleep -Seconds 2

# get latest download url for git-for-windows 64-bit exe
$git_url = "https://api.github.com/repos/git-for-windows/git/releases/latest"
$asset = Invoke-RestMethod -UseBasicParsing -Method Get -Uri $git_url | ForEach-Object assets | Where-Object name -like "*64-bit.exe"
# download installer
$installer = "$env:temp\$($asset.name)"
Invoke-WebRequest -UseBasicParsing -Uri $asset.browser_download_url -OutFile $installer
# run installer
$git_install_inf = "<install inf file>"
$install_args = "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LOADINF=""$git_install_inf"""
Start-Process -FilePath $installer -ArgumentList $install_args -Wait