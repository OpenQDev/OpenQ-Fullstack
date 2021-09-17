#!/bin/bash
echo -e "Booting OpenQ devevelopment environment\n"
echo -e "Assumes an Ethreum RPC node is running at localhost:8545\n"

if [ -d "./contracts" ] 
then
    echo -e "/contracts directory found\n" 
else
    echo -e "No contracts directory found. Cloning contracts...\n"
    git clone https://github.com/OpenQDev/contracts.git
fi

cd ./contracts
yarn
yarn deploy:local

cd ..

if [ -d "./OpenQ-API" ] 
then
    echo -e "\n/OpenQ-API directory found\n" 
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

docker compose up