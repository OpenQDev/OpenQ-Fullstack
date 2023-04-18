#!/bin/bash
. ./clone.sh
. ./colors.sh
chmod u+x asciiart.sh
./asciiart.sh
chmod u+x env.sh
. ./env.sh

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

for repo in "${repos[@]}"; do
	echo -e "\n${BBlue}$repo${Color_Off}"
	clone "$repo"
	generate_dot_env "$repo"
done

# Save a local file of the openq launched containers for later deletion and removal

echo -e ${Cyan}"Starting all OpenQ containers from scratch..."${Color_Off}
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
echo -e ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

docker-compose -f docker-compose-drm.yml up