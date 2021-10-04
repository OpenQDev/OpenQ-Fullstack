#!/bin/bash
. ./colors.sh

cd ./OpenQ-Contracts
echo -e "Deploying Hardhat Ethreum RPC node on localhost:8545...\n"
echo -e "You can find the local nodes public/private keys in ${BBlue}OpenQ-Contracts/nohup.out${Color_Off}\n"

if lsof -Pi :8545 -sTCP:LISTEN -t >/dev/null ; then
    echo -e "${BRed}You have a process running on port 8545!${Color_Off}"
    echo -e "Run ${Red}lsof -ti tcp:8545 | xargs kill${Color_Off} to kill it."
    exit 1
else
    if [ -f "./nohup.out" ]
    then
        rm ./nohup.out    
    fi
    nohup yarn ethnode &
fi