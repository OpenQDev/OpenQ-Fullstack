#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-Frontend" ] 
then
    echo -e "\n/OpenQ-Frontend directory found\n" 
else
    echo -e "No OpenQ-Frontend directory found. Cloning OpenQ-Frontend...\n"
    git clone https://github.com/OpenQDev/OpenQ-Frontend.git
fi
cd ./OpenQ-Frontend
touch .env
yarn