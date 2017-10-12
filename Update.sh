#!/bin/bash

# Color consts
LIGHT_RED_COLOR='\033[1;31m'
YELLOW_COLOR='\033[1;33m'
LIGHT_PURPLE_COLOR='\033[1;35m'
LIGHT_CYAN_COLOR='\033[1;36m'
NO_COLOR='\033[0m'

if [ $EUID -ne 0 ]; then
  echo -e "${YELLOW_COLOR}This script have to be executed as user with ${LIGHT_RED_COLOR}root privileges${NO_COLOR}${YELLOW_COLOR}!${NO_COLOR}"
  exit 1
fi

echo -e "${LIGHT_PURPLE_COLOR}Updating list of packages...${NO_COLOR}"
apt-get update

echo -e "${LIGHT_PURPLE_COLOR}Updating installed packages...${NO_COLOR}"
apt-get dist-upgrade

echo -e "${LIGHT_PURPLE_COLOR}Cleaning up...${NO_COLOR}"
apt-get clean

echo -e "${LIGHT_PURPLE_COLOR}Updating firmware to the lastest available version...${NO_COLOR}"
rpi-update

echo -e "${YELLOW_COLOR}Done. You will probably need to ${LIGHT_CYAN_COLOR}reboot${NO_COLOR}"
