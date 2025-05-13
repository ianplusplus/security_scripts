#!/bin/bash

echo "===== IP Forwarding Check ====="
sysctl net.ipv4.ip_forward

echo -e "\n===== Active Interfaces ====="
ip -br a

echo -e "\n===== iptables -vL ====="
sudo iptables -L -n -v

echo -e "\n===== iptables NAT Rules ====="
sudo iptables -t nat -L -n -v

echo -e "\n===== DNSMasq Status ====="
systemctl status dnsmasq | grep -E "Active|Main PID"

echo -e "\n===== Routing Table ====="
ip route

echo -e "\n===== Listening Services ====="
sudo ss -tunlp

echo -e "\n===== Confirm DNSMasq is binding on ens19 and 10.10.10.1 ====="
sudo ss -ulnpt | grep dnsmasq
