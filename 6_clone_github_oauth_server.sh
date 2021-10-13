#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-Github-OAuth-Server" ] 
then
    echo -e "\n/OpenQ-Github-OAuth-Server directory found\n" 
else
    echo -e "No OpenQ-Github-OAuth-Server directory found. Cloning OpenQ-Github-OAuth-Server...\n"
    git clone https://github.com/OpenQDev/OpenQ-Github-OAuth-Server.git
fi