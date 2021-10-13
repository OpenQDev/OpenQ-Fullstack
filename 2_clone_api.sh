#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-API" ] 
then
    echo -e "OpenQ-API directory found\n" 
else
    echo -e "No OpenQ-API directory found. Cloning OpenQ-API...\n"
    git clone https://github.com/OpenQDev/OpenQ-API.git
fi