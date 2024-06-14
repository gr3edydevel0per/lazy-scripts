#! /bin/bash


# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}


 cat << "EOF"
  _    _            _             ____              _    _____ _                   
 | |  | |          | |           |  _ \            | |  / ____| |                  
 | |__| | __ _  ___| | _____ _ __| |_) | ___   ___ | |_| (___ | |_ _ __ __ _ _ __  
 |  __  |/ _` |/ __| |/ / _ \ '__|  _ < / _ \ / _ \| __|\___ \| __| '__/ _` | '_ \ 
 | |  | | (_| | (__|   <  __/ |  | |_) | (_) | (_) | |_ ____) | |_| | | (_| | |_) |
 |_|  |_|\__,_|\___|_|\_\___|_|  |____/ \___/ \___/ \__|_____/ \__|_|  \__,_| .__/ 
                                                                            | |    
                                                                            |_|    

EOF

# Testing if root...
if [ $UID -ne 0 ]
then
	RED " 🚨 You must run this script as root!" && echo
	exit
fi




BLUE "Updating repositories..."
sudo apt update

BLUE "Installing Kali System"
sudo apt install kali-linux-everything -y


BLUE "Installing SecList"
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
  && unzip SecList.zip \
  && rm -f SecList.zip && mv SecList /usr/share/wordlists/
