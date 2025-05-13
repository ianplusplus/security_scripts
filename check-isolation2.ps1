Write-Host "`n===== IP Config ====="
ipconfig

Write-Host "`n===== DNS Resolution Check ====="
Resolve-DnsName google.com

Write-Host "`n===== Default Gateway Ping (10.10.10.1) ====="
Test-Connection 10.10.10.1 -Count 2

Write-Host "`n===== Internet Connectivity Test ====="
Invoke-WebRequest -Uri "https://1.1.1.1" -UseBasicParsing

Write-Host "`n===== Check for LAN Access (192.168.0.1) ====="
Test-Connection 192.168.0.1 -Count 2

Write-Host "`n===== Open Ports Locally (for auditing) ====="
Get-NetTCPConnection -State Listen | Select-Object LocalAddress, LocalPort
