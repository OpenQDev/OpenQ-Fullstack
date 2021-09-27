#!/bin/bash
echo -e "Booting OpenQ devevelopment environment\n"

# Grant execution permissions to bootscript
chmod u+x setup_contracts.sh
chmod u+x setup_node.sh
chmod u+x setup_api.sh
chmod u+x setup_frontend.sh
chmod u+x setup_fullstack.sh

# Pull repos (if not present) and install dependencies
./setup_contracts.sh
./setup_node.sh
./setup_api.sh
./setup_frontend.sh

# Copy contract addresses and provider URL
echo -e "Copying .env.docker file to OpenQ-API to connect to proper RPC node and contract addresses\n"
cp ./contracts/.env.docker ./OpenQ-API/.env.docker
echo -e "Copying .env.docker file to frontend .env to connect to proper RPC node and contract addresses\n"
cp ./contracts/.env.docker ./frontend/.env
cat PAT >> ./frontend/.env

# Boot and wire fullstack with Docker compose
./setup_fullstack.sh
