#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

# Grant execution permissions to bootscript
chmod u+x 1_contracts.sh
chmod u+x 2_api.sh
chmod u+x 3_frontend.sh
chmod u+x 4_helm.sh
chmod u+x 5_kubeconfig.sh
chmod u+x 6_github_oauth_server.sh
chmod u+x 7_cert_manager.sh
chmod u+x 8_fullstack.sh

./1_contracts.sh
./2_api.sh
./3_frontend.sh
./4_helm.sh
./5_kubeconfig.sh
./6_github_oauth_server.sh
./7_cert_manager.sh

cat PAT > ./OpenQ-Contracts/.env.docker
if test $? -eq 1
then
    echo -e "${Red}You need to add a GitHub Personal Access Token (PAT) to a file simply called PAT if you want to continue.${Color_Off}"
    echo -e "To get a PAT, follow the instructions here: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token"
    echo -e "NOTE: You will need the full repo and user privileges."
    lsof -ti tcp:8545 | xargs kill
    exit 1
else
		echo -e "PAT copied into environment file. Proceeding..."
fi

printf "\n" >> ./OpenQ-Contracts/.env.docker
cat ./OpenQ-Contracts/.env >> ./OpenQ-Contracts/.env.docker

# The remaining environment variables consisting of contract addresses can only be known at the time of deployment.
# As such, they are written to ./OpenQ-Contract/.env.docker by deploy/deploy.js
./8_fullstack.sh $1