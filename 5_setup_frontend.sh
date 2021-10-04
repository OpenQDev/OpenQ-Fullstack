#!/bin/bash
. ./colors.sh

if [ -d "./frontend" ] 
then
    echo -e "\n/frontend directory found\n" 
else
    echo -e "No frontend directory found. Cloning frontend...\n"
    git clone https://github.com/OpenQDev/frontend.git
fi
cd ./frontend
touch .env
yarn