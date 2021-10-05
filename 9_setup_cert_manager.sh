#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-CertManager" ] 
then
    echo -e "\n/OpenQ-CertManager directory found\n" 
else
    echo -e "No OpenQ-CertManager directory found. Cloning OpenQ-CertManager...\n"
    git clone https://github.com/OpenQDev/OpenQ-CertManager.git
fi