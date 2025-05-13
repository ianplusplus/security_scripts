# Test Internet access
Write-Host "Testing internet access (1.1.1.1)..."
Test-Connection -Count 2 1.1.1.1

# Test access to a DNS name
Write-Host "Testing DNS resolution and web access..."
Invoke-WebRequest -Uri "https://www.cloudflare.com" -UseBasicParsing

# Test local LAN (adjust IPs as needed)
$lanTargets = @("192.168.0.1", "192.168.0.100")
foreach ($ip in $lanTargets) {
    Write-Host "`nTesting access to $ip (LAN/proxmox)..."
    Test-Connection -Count 2 $ip
}

# Check open ports on LAN targets
foreach ($ip in $lanTargets) {
    Write-Host "`nScanning common ports on $ip..."
    Test-NetConnection -ComputerName $ip -Port 22
    Test-NetConnection -ComputerName $ip -Port 8006  # Proxmox web UI
}
