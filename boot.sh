#!/bin/bash
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh


if [[ -z "$PAT" ]]; then
	echo -e "${Yellow}You need to set your GitHub PAT as an environment variable and run boot.sh again:${Color_Off}\n"
	echo -e "export PAT=..."
	exit 1
fi

clone() {
	if [ -d "./$1" ]; then
		echo -e "${Blue}$1 directory found${Color_Off}\n"
	else
		echo -e "${UCyan}No $1 directory found. Cloning $1...${Color_Off}\n"
		git clone https://github.com/OpenQDev/$1.git
	fi
}

declare -a repos=(
	"OpenQ-CoinAPI"
	"OpenQ-Oracle"
	"OpenQ-Frontend"
	"OpenQ-Contracts"
	"OpenQ-Github-OAuth-Server"
	"OpenQ-Helm"
	"OpenQ-JSON-RPC-Node"
	"OpenQ-CertManager"
	"OpenQ-Graph"
	"OpenQ-Kubeconfig"
	"OpenQ-Bot"
	"OpenQ-API"
	"OpenQ-Architecture"
	"OpenQ-Github-Proxy"
	"OpenQ-Invoice-Server"
	"OpenQ-OZ-Claim-Autotask"
	"OpenQ-Bounty-Actions-Autotask"
	"OpenQ-Event-Listener"
	"OpenQ-Token-Price-Cron-Job"
	"Superfluid-Subgraph"
	"OpenQ-User-Registration"
)

for repo in "${repos[@]}"; do
	echo -e "\n${BBlue}$repo${Color_Off}"
	clone "$repo"

	if [ -f "./$repo/.env.sample" ]; then
		cp "./$repo/.env.sample" "./$repo/.env"
		sed -i 's/PAT=.*/PAT='"$PAT"'/' "./$repo/.env"
		sed -i 's/PATS=.*/PATS='"$PAT"'/' "./$repo/.env"
		# Woring around Git Guardian for test app secret
		sed -i 's/OPENQ_SECRET=.*/OPENQ_SECRET='"7e2c7f6d0a297492f40fc9d04c6671bb91d44bfb"'/' "./$repo/.env"
	fi
done

# Save a local file of the openq launched containers for later deletion and removal

echo -e ${Cyan}"Starting all OpenQ containers from scratch..."${Color_Off}
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
echo -e ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

docker-compose -f docker-compose.yml up
