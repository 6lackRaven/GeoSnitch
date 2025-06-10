# 🛰️ GeoSnitch

**GeoSnitch** is a powerful location-tracking toolkit that leverages social engineering to obtain precise geolocation data via phishing.  
Built on top of [Seeker](https://github.com/thewhiteh4t/seeker) with Cloudflare tunneling support and terminal automation, GeoSnitch offers a fast and simple way to launch payloads and track users — all within Termux or any Linux shell.

---

## ⚙️ Features

- 📍 Real-time geolocation tracking via Seeker
- 🌐 Public tunnel link via Cloudflare (no need for ngrok)
- 🧠 Automated setup using `tmux`
- ✅ Auto-detects and clones Seeker if not present
- 🧪 Payload selection menu (custom & pre-built)
- 🧾 Clean terminal output with status + generated link

---

## 🧰 Requirements

- [Termux](https://f-droid.org/en/packages/com.termux/) or any Linux shell
- Python 3
- `tmux`, `git`, `cloudflared`, `curl`
- Python dependencies:  
  - `psutil`
  - `requests`

---

## 📦 Installation

```bash
pkg update && pkg install -y python git tmux curl
pip install psutil requests
git clone https://github.com/6lackRaven/GeoSnitch.git
cd GeoSnitch
chmod +x geosnitch.sh

---

## 🚀 Usage

./geosnitch.sh

You'll be prompted to select your payload, and the tool will:

Start Seeker

Launch Cloudflare tunnel

Display your phishing link (e.g. https://xyz.trycloudflare.com)

Wait for a target to visit the page

Log their location data


> Logs and captured info are stored in the seeker/db folder.


--

## ⚠️ Disclaimer

> This tool is intended for educational and ethical testing purposes only.
Unauthorized tracking or phishing activity is illegal and punishable under law.
The author is not responsible for misuse of this tool.




---

💻 Author

👨‍💻 6lackRaven — GitHub



---

🌟 Star the repo if you found it useful!
