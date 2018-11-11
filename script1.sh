#! /bin/bash
# Script for output info about system

GREEN="\033[32m"
BLUE="\033[34m"
NORMAL="\033[0m"
clear
echo -e "\033[31;1m USER NAME: `users` ${NORMAL}"
echo -e "${GREEN} DATE: `date +"%Y-%m-%d"` ${NORMAL}"
echo -e "\033[33m TIMEWORK: `uptime` ${NORMAL}"
echo -e "${BLUE} IP ADDRESS: `hostname -I` ${NORMAL}"
echo -e "\033[35;1m\n MEMORY INFO:\n `free -m` ${NORMAL}"
echo -e "\033[36m\n DISK INFO:\n `df -H`\n \033[0m"



