#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

export DEPLOY_ENV=$1

clone() {
if [ -d "./$1" ] 
then
    echo -e "${Blue}$1 directory found${Color_Off}\n" 
else
    echo -e "${UCyan}No $1 directory found. Cloning $1...${Color_Off}\n"
    git clone https://github.com/OpenQDev/$1.git
fi
}

declare -a repos=("OpenQ-Oracle"
                "OpenQ-API"
                "OpenQ-CoinAPI"
                "OpenQ-Frontend" 
                "OpenQ-Contracts"
                "OpenQ-Github-OAuth-Server"
                "OpenQ-Helm"
                "OpenQ-JSON-RPC-Node"
                "OpenQ-CertManager"
                "OpenQ-Kubeconfig"
                )

for repo in "${repos[@]}"
do
    echo -e "\n${BBlue}$repo${Color_Off}"
    clone "$repo"
done

docker-compose up $2