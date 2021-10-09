#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-Helm" ] 
then
    echo -e "\n/OpenQ-Helm directory found\n" 
else
    echo -e "No OpenQ-Helm directory found. Cloning OpenQ-Helm...\n"
    git clone https://github.com/OpenQDev/OpenQ-Helm.git
fi