# bash-utils
## 🛠 Linux Utility Scripts Collection

A collection of **useful Bash scripts** to automate and simplify various system tasks, maintenance, and productivity workflows.

## 📌 Features
- 🚀 **System Maintenance**: Update, clean, and monitor your Linux system.
- 📂 **File Management**: Batch rename, organize, and sync files.
- 🌐 **Networking & Security**: Test internet speed, manage firewall rules, and check ports.
- 🔧 **Development Tools**: Git automation, Docker cleanup, and package updates.
- 🎉 **Fun & Miscellaneous**: ASCII banners, password generators, and countdown timers.

## 📂 Script Categories

### 🔧 System Maintenance
- **[`sys-update.sh`](scripts/system/sys-update.sh)** – Update and clean your Ubuntu system.
- **[`cleanup.sh`](scripts/system/cleanup.sh)** – Remove unnecessary files and free up space.
- **[`monitor-resources.sh`](scripts/system/monitor-resources.sh)** – Monitor CPU, RAM, and network usage.

### 📂 File & Directory Management
- **[`remove-pattern.sh`](scripts/file-management/remove-pattern.sh)** – Remove unwanted text patterns from file names.
- **[`batch-rename.sh`](scripts/file-management/batch-rename.sh)** – Mass rename files using rules.
- **[`organize-downloads.sh`](scripts/file-management/organize-downloads.sh)** – Sort downloaded files by type.

### 🌐 Networking & Security
- **[`wifi-speed-test.sh`](scripts/networking/wifi-speed-test.sh)** – Check your internet speed.
- **[`port-checker.sh`](scripts/networking/port-checker.sh)** – Scan and list open ports.
- **[`firewall-rules.sh`](scripts/networking/firewall-rules.sh)** – Easily manage firewall rules.

### 💻 Development Tools
- **[`git-helper.sh`](scripts/dev-tools/git-helper.sh)** – Automate common Git commands.
- **[`docker-cleanup.sh`](scripts/dev-tools/docker-cleanup.sh)** – Clean unused Docker images and containers.
- **[`check-updates.sh`](scripts/dev-tools/check-updates.sh)** – Check for updates in installed applications.

### 🎉 Fun & Miscellaneous
- **[`ascii-banner.sh`](scripts/fun/ascii-banner.sh)** – Generate cool ASCII banners.
- **[`random-password.sh`](scripts/fun/random-password.sh)** – Generate strong random passwords.
- **[`countdown-timer.sh`](scripts/fun/countdown-timer.sh)** – Simple countdown timer in the terminal.

## 🚀 Installation & Usage
### Clone the Repository
```bash
git clone https://github.com/yourusername/ez-scripts.git
cd ez-scripts
```

### Run a Script
Make a script executable and run it:
```bash
chmod +x scripts/system/ubuntu-update.sh
sudo scripts/system/ubuntu-update.sh
```

### Add Scripts to PATH (Optional)
To run scripts from anywhere, add them to your `PATH`:
```bash
echo 'export PATH="$HOME/ez-scripts/scripts:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
Now, you can run:
```bash
sys-update.sh
```

## 🤝 Contributing
Got a useful script? Feel free to contribute!

1. Fork the repo & clone it.
2. Add your script inside the appropriate category.
3. Make sure it's **well-documented** and **executable (`chmod +x script.sh`)**.
4. Create a Pull Request.

## 📜 License
This project is open-source and licensed under the **MIT License**.

---
🔥 **Enjoy automating your Linux workflow!** 🚀

