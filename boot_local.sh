#!/bin/bash
echo -e "Booting OpenQ devevelopment environment\n"

if [ -d "./contracts" ] 
then
    echo -e "/contracts directory found\n" 
else
    echo -e "No contracts directory found. Cloning contracts...\n"
    git clone https://github.com/OpenQDev/contracts.git
fi

cd ./contracts
yarn

echo -e "Deploying Hardhat Ethreum RPC node on localhost:8545\n"
echo -e "This will take 5 seconds..."
echo -e "You can find the local nodes public/private keys in contracts/nohup.out\n"
nohup yarn ethnode &
sleep 5
yarn deploy:local

echo -e "Contracts deployed to Hardhat blockchain\n"

cd ..

if [ -d "./OpenQ-API" ] 
then
    echo -e "OpenQ-API directory found\n" 
else
    echo -e "No OpenQ-API directory found. Cloning OpenQ-API...\n"
    git clone https://github.com/OpenQDev/OpenQ-API.git
fi

echo -e "Copying .env.docker file to OpenQ-API to connect to proper RPC node and contract addresses\n"
cp ./contracts/.env.docker ./OpenQ-API/.env.docker
cd ./OpenQ-API
yarn

cd ..

if [ -d "./frontend" ] 
then
    echo -e "\n/frontend directory found\n" 
else
    echo -e "No frontend directory found. Cloning frontend...\n"
    git clone https://github.com/OpenQDev/frontend.git
fi

if [ $1 == "build" ]
then
    docker compose up --build
else
    docker compose up
fi
