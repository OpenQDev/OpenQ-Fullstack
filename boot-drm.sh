#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh

clone() {
if [ -d "./$1" ] 
then
    echo -e "${Blue}$1 directory found${Color_Off}\n" 
else
    echo -e "${UCyan}No $1 directory found. Cloning $1...${Color_Off}\n"
    git clone https://github.com/OpenQDev/$1.git
fi
}

declare -a repos=(
                "OpenQ-CoinAPI"
								"OpenQ-Oracle"
                "OpenQ-DRM-Frontend" 
                "OpenQ-Contracts"
                "OpenQ-Github-OAuth-Server"
                "OpenQ-Helm"
                "OpenQ-JSON-RPC-Node"
                "OpenQ-CertManager"
								"OpenQ-Graph"
                "OpenQ-Kubeconfig"
								"OpenQ-API"
								"OpenQ-Architecture"
								"OpenQ-OZ-Claim-Autotask"
								"OpenQ-Documentation"
								"OpenQ-Bounty-Actions-Autotask"
								"OpenQ-Event-Listener"
								"OpenQ-Token-Price-Cron-Job"
								"Superfluid-Subgraph"
								"OpenQ-User-Registration"
                )

for repo in "${repos[@]}"
do
    echo -e "\n${BBlue}$repo${Color_Off}"
    clone "$repo"
done

echo -e "${Red}NOTE:${Color_Off} ${Blue}You will need .env files in the root of the following repositories: ${Color_Off}" 
echo -e ${Cyan}"- OpenQ-DRM-Frontend"${Color_Off}
echo -e ${Cyan}"- OpenQ-Oracle"${Color_Off}
echo -e ${Cyan}"- OpenQ-Contracts"${Color_Off}
echo -e ${Cyan}"- OpenQ-Github-OAuth-Server"${Color_Off}
echo -e ${Cyan}"- OpenQ-OZ-Claim-Autotask"${Color_Off}
echo -e ${Cyan}"- OpenQ-CoinAPI"${Color_Off}
echo -e ${Cyan}"- OpenQ-Event-Lsitener"${Color_Off}
echo -e ${Cyan}"- OpenQ-Bounty-Actions-Autotask\n"${Color_Off}

echo -e ${Blue}"No worries! See the README for instructions\n"${Color_Off}

# Save a local file of the openq launched containers for later deletion and removal

echo -e ${Cyan}"Starting all OpenQ containers from scratch..."${Color_Off}
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
echo -e ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

docker-compose -f docker-compose-drm.yml up