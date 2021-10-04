#!/bin/bash
. ./colors.sh

echo -e "${BBlue}Booting OpenQ devevelopment environment${Color_Off}\n"

# Grant execution permissions to bootscript
chmod u+x 1_setup_contracts.sh
chmod u+x 2_setup_node.sh
chmod u+x 3_deploy_contracts.sh
chmod u+x 4_setup_api.sh
chmod u+x 5_setup_frontend.sh
chmod u+x 6_setup_helm.sh
chmod u+x 7_setup_fullstack.sh

# Pull repos (if not present) and install dependencies
./1_setup_contracts.sh
./2_setup_node.sh
./3_deploy_contracts.sh
./4_setup_api.sh
./5_setup_frontend.sh
./6_setup_helm.sh

# Copy contract addresses and provider URL
echo -e "Copying .env.docker file to OpenQ-API to connect to proper RPC node and contract addresses\n"
cp ./contracts/.env.docker ./OpenQ-API/.env.docker
echo -e "Copying .env.docker file to frontend .env to connect to proper RPC node and contract addresses\n"
cp ./contracts/.env.docker ./frontend/.env
cp -R ./contracts/artifacts ./frontend/
cat PAT >> ./frontend/.env

./7_setup_fullstack.sh $1
