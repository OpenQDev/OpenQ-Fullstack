#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-JSON-RPC-Node" ] 
then
    echo -e "\n/OpenQ-JSON-RPC-Node directory found\n" 
else
    echo -e "No OpenQ-JSON-RPC-Node directory found. Cloning OpenQ-JSON-RPC-Node...\n"
    git clone https://github.com/OpenQDev/OpenQ-JSON-RPC-Node.git
fi