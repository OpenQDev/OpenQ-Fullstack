#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

# Grant execution permissions to bootscript
chmod u+x 1_setup_contracts.sh
chmod u+x 2_setup_node.sh
chmod u+x 3_deploy_contracts.sh
chmod u+x 4_setup_api.sh
chmod u+x 5_setup_frontend.sh
chmod u+x 6_setup_helm.sh
chmod u+x 7_setup_kubeconfig.sh
chmod u+x 8_setup_github_oauth_server.sh
chmod u+x 9_setup_fullstack.sh

# Pull repos (if not present) and install dependencies
./1_setup_contracts.sh
./2_setup_node.sh
# Exit if a process was running on port 8545
if test $? -eq 1
then
    echo -e "See you soon!"
    exit 1
else
	echo -e "Ethereum RPC Node deployed to port 8545. Proceeding..."
fi

./3_deploy_contracts.sh
./4_setup_api.sh
./5_setup_frontend.sh
./6_setup_helm.sh
./7_setup_kubeconfig.sh
./8_setup_github_oauth_server.sh

# Copy contract addresses and provider URL
echo -e "Copying .env.docker file to OpenQ-API to connect to proper RPC node and contract addresses\n"
cp ./OpenQ-Contracts/.env.docker ./OpenQ-API/.env.docker
echo -e "Copying .env.docker file to frontend .env to connect to proper RPC node and contract addresses\n"
cp ./OpenQ-Contracts/.env.docker ./OpenQ-Frontend/.env
cp -R ./OpenQ-Contracts/artifacts ./OpenQ-Frontend/

cat PAT >> ./OpenQ-Frontend/.env
if test $? -eq 1
then
    echo -e "${Red}You need to add a GitHub Personal Access Token (PAT) to a file simply called PAT if you want to continue.${Color_Off}"
    echo -e "To get a PAT, follow the instructions here: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token"
    echo -e "NOTE: You will need repo and org read access :-)"
    lsof -ti tcp:8545 | xargs kill
    exit 1
else
		echo -e "PAT copied into frontend. Proceeding..."
fi

./9_setup_fullstack.sh $1
