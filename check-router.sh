#!/bin/bash

echo "===== Interface Info ====="
ip addr show ens18
ip addr show ens19

echo -e "\n===== Routing Table ====="
ip route

echo -e "\n===== DNSMASQ Status ====="
systemctl status dnsmasq --no-pager | head -20

echo -e "\n===== IPTABLES (FORWARD) Rules ====="
sudo iptables -L FORWARD -n -v

echo -e "\n===== NAT Rules ====="
sudo iptables -t nat -L POSTROUTING -n -v

echo -e "\n===== Ping Test to Internet ====="
ping -c 2 1.1.1.1

echo -e "\n===== DNS Test from Router ====="
dig google.com @127.0.0.1 +short

echo -e "\n===== DONE ====="
