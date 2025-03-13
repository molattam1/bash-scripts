#!/bin/bash

# Define colors for text output (only if running in a terminal)
if [[ -t 1 ]]; then
    RED=$(tput setaf 1)
    YELLOW=$(tput setaf 3)
    GREEN=$(tput setaf 2)
    RESET=$(tput sgr 0)
fi

# Display script header
echo -e "${GREEN}
=========================================
        System Update & Cleanup
=========================================${RESET}"

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: This script must be run as root! Use sudo.${RESET}"
    exit 1
fi

# Help message
usage() {
    echo -e "${YELLOW}
Usage: sudo bash $0 [OPTIONS]
No options       - Run all updates (recommended)
-u               - Skip apt-get update
-g               - Skip apt-get upgrade -y
-d               - Skip apt-get dist-upgrade -y
-r               - Skip apt-get clean
-h               - Show this help message and exit
${RESET}"
    exit 0
}

# Parse command-line options
while getopts ":ugdrh" OPT; do
    case ${OPT} in
        u ) SKIP_UPDATE=1 ;;
        g ) SKIP_UPGRADE=1 ;;
        d ) SKIP_DIST_UPGRADE=1 ;;
        r ) SKIP_CLEAN=1 ;;
        h ) usage ;;
        \?) echo -e "${RED}Invalid option: -$OPTARG${RESET}"; usage ;;
    esac
done

# Log file for updates
LOG_FILE="/tmp/sys_update.log"
> "$LOG_FILE"  # Clear log file

# Function to execute commands with logging
run_task() {
    local description=$1
    shift
    echo -e "${GREEN}[*] $description...${RESET}"
    "$@" | tee -a "$LOG_FILE"
}

# Perform system update tasks
[[ -z "$SKIP_UPDATE" ]] && run_task "Updating package list" apt-get update
[[ -z "$SKIP_UPGRADE" ]] && run_task "Upgrading installed packages" apt-get upgrade -y
[[ -z "$SKIP_DIST_UPGRADE" ]] && run_task "Performing full distribution upgrade" apt-get dist-upgrade -y
[[ -z "$SKIP_CLEAN" ]] && run_task "Cleaning up unused packages" apt-get clean

# Check for important messages in the logs
echo -e "${GREEN}[*] Checking logs for warnings, errors, or required actions...${RESET}"
grep -Ewi --color=auto 'warning|error|critical|reboot|restart|autoremove' "$LOG_FILE" | sort -u || echo "No critical messages found."

# Remove temporary log file
rm -f "$LOG_FILE"

echo -e "${GREEN}
=========================================
  System update and cleanup completed!  
=========================================${RESET}"
exit 0
