#!/bin/bash
. ./colors.sh

if [ -d "./contracts" ] 
then
    echo -e "/contracts directory found\n" 
else
    echo -e "No contracts directory found. Cloning contracts...\n"
    git clone https://github.com/OpenQDev/contracts.git
fi
cd ./contracts
yarn