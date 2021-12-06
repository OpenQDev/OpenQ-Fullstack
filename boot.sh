#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

export DEPLOY_ENV=docker

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
								"OpenQ-Graph"
                "OpenQ-Kubeconfig"
								"OpenQ-Bot"
                )

for repo in "${repos[@]}"
do
    echo -e "\n${BBlue}$repo${Color_Off}"
    clone "$repo"
done

echo -e "${Red}NOTE:${Color_Off} ${Blue}You will need .env files in the root of the following repositories: ${Color_Off}" 
echo -e ${Cyan}- OpenQ-Frontend${Color_Off}
echo -e ${Cyan}- OpenQ-Oracle${Color_Off}
echo -e ${Cyan}- OpenQ-Github-OAuth-Server${Color_Off}
echo -e ${Cyan}- OpenQ-CoinAPI \n${Color_Off}

echo -e ${Blue}No worries! See the README for instructions${Color_Off}

if [ -d "./data" ]
then
	echo "Data dir found"
else
	echo "No data dir found. creating..."
  mkdir data
	echo "Data dir created"
fi

if [ -d "./data/ipfs" ]
then
    rm -rf ./data/ipfs
else
    echo "No data dir found for IPFS. This is good, otherwise the Graph complains about a mismatch between genesis blocks."
fi

if [ -d "./data/postgres" ] 
then
    rm -rf ./data/postgres
		mkdir ./data/postgres
		sudo chmod -R 777 ./data/postgres
else
		mkdir ./data/postgres
		sudo chmod -R 777 ./data/postgres
    echo "No data dir found for Postgres. This is good, otherwise the Graph complains about a mismatch between genesis blocks."
fi

docker-compose -f docker-compose.yml up $2