#!/bin/bash
cd ./contracts
echo -e "Deploying Hardhat Ethreum RPC node on localhost:8545\n"
echo -e "This will take 5 seconds..."
echo -e "You can find the local nodes public/private keys in contracts/nohup.out\n"

if [ -f "./nohup.out" ]
then
    rm ./nohup.out    
fi

nohup yarn ethnode &
sleep 5