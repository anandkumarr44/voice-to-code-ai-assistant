# PowerShell script to install Node.js
Write-Host "Installing Node.js..." -ForegroundColor Green

# Download Node.js installer
$nodeVersion = "20.10.0"
$nodeUrl = "https://nodejs.org/dist/v$nodeVersion/node-v$nodeVersion-x64.msi"
$installerPath = "$env:TEMP\nodejs-installer.msi"

Write-Host "Downloading Node.js v$nodeVersion..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $nodeUrl -OutFile $installerPath

Write-Host "Installing Node.js..." -ForegroundColor Yellow
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait

Write-Host "Node.js installation completed!" -ForegroundColor Green
Write-Host "Please restart your terminal to use npm commands." -ForegroundColor Yellow

# Clean up
Remove-Item $installerPath -Force -ErrorAction SilentlyContinue 