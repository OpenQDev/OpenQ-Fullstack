#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

export DEPLOY_ENV=$1

clone() {
if [ -d "./$1" ] 
then
    echo -e "$1 directory found\n" 
else
    echo -e "No $1 directory found. Cloning $1...\n"
    git clone https://github.com/OpenQDev/$1.git
fi
}

declare -a repos=("OpenQ-API" 
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
    echo $repo
   clone "$repo"
done

docker-compose up $2