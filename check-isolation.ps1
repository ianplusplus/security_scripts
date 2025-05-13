Write-Host "===== Network Configuration ====="
ipconfig

Write-Host "`n===== Default Gateway & DNS ====="
$gw = (Get-NetIPConfiguration).IPv4DefaultGateway.NextHop
$dns = (Get-DnsClientServerAddress -AddressFamily IPv4).ServerAddresses
Write-Host "Gateway: $gw"
Write-Host "DNS: $($dns -join ', ')"

Write-Host "`n===== Testing Internet Access ====="
Test-Connection -ComputerName 1.1.1.1 -Count 2
Resolve-DnsName google.com
Test-NetConnection google.com -Port 80

Write-Host "`n===== Testing Blocked LAN Access ====="
Test-Connection -ComputerName 192.168.0.1 -Count 2
Test-NetConnection 192.168.0.1 -Port 3389

Write-Host "`n===== DONE ====="
