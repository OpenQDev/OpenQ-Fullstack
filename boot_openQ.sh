#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

# Grant execution permissions to bootscript
chmod u+x 1_setup_contracts.sh
chmod u+x 3_deploy_contracts.sh
chmod u+x 4_setup_api.sh
chmod u+x 5_setup_frontend.sh
chmod u+x 6_setup_helm.sh
chmod u+x 7_setup_kubeconfig.sh
chmod u+x 8_setup_github_oauth_server.sh
chmod u+x 9_setup_cert_manager.sh
chmod u+x 10_setup_fullstack.sh

./1_setup_contracts.sh
./4_setup_api.sh
./5_setup_frontend.sh

# override only this key without deleting others
cat PAT >> ./OpenQ-Contracts/.env.docker
if test $? -eq 1
then
    echo -e "${Red}You need to add a GitHub Personal Access Token (PAT) to a file simply called PAT if you want to continue.${Color_Off}"
    echo -e "To get a PAT, follow the instructions here: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token"
    echo -e "NOTE: You will need the full repo and user privileges."
    lsof -ti tcp:8545 | xargs kill
    exit 1
else
		echo -e "PAT copied into frontend. Proceeding..."
fi

./10_setup_fullstack.sh $1

# Since docker compose doesnt wait for ethnode to be fully "ready", add logic to deploy that ensures it's reachable before deploying
# Is this already part of deploy?
