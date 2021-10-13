#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-Contracts" ] 
then
    echo -e "/OpenQ-Contracts directory found\n" 
else
    echo -e "No OpenQ-Contracts directory found. Cloning OpenQ-Contracts...\n"
    git clone https://github.com/OpenQDev/OpenQ-Contracts.git
fi