#!/bin/bash
RED='\033[1;31m'
GREEN='\033[00;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
HOME=/root
LOGNAME=root
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LANG=en_US.UTF-8
SHELL=/bin/sh
PWD=/root
printf "\n\n\n\n\n\n\n\n\n\n\n"
printf "${YELLOW}#########################################################################${NC}\n"
printf "${GREEN}                   SYSTEM Upgrade/Update e Clean                        ${NC}\n"
printf "${YELLOW}#########################################################################${NC}\n\n"
sleep 2
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get update
apt-get autoremove -y
apt-get autoclean -y

printf "\n\n\n\n\n\n\n\n\n\n\n"
printf "${YELLOW}#########################################################################${NC}\n"
printf "${GREEN}                   FIREWALL Setup                        ${NC}\n"
printf "${YELLOW}#########################################################################${NC}\n\n"
sleep 2
apt-get install ufw -y
    ufw allow ssh/tcp    #Open SSH port
    ufw limit ssh/tcp
    ufw logging on
    ufw enable -y
    ufw status

printf "\n\n\n\n\n\n\n\n\n\n\n"
printf "${YELLOW}#########################################################################${NC}\n"
printf "${GREEN}                   Utility Setup                        ${NC}\n"
printf "${YELLOW}#########################################################################${NC}\n\n"
sleep 2
apt-get install fail2ban -y
apt-get install nano -y
apt-get install unzip -y


printf "\n\n"
printf "${YELLOW}#########################################################################${NC}\n"
printf "${RED}#                   SYSTEM REBOOT                                       # ${NC}\n"
printf "${YELLOW}#########################################################################${NC}\n"
# choose if reboot
printf "${RED}\nWould you reboot system? (Y/N)"
read -n 1 -r
echo    # (optional) move to a new line
# auto update masternode
if [[ $REPLY =~ ^[Yy]$ ]]; then
systemctl reboot
fi
printf "${YELLOW}\nDONE\n"
printf "${NC}\n"
