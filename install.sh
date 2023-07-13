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
	"OpenQ-OZ-Claim-Autotask"
	"OpenQ-Bounty-Actions-Autotask"
	"OpenQ-Event-Listener"
	"OpenQ-Token-Price-Cron-Job"
	"Superfluid-Subgraph"
	"OpenQ-User-Registration"
	"OpenQ-Email-Server"
	"OpenQ-Document-Manager"
	"OpenQ-Notification-Autotask"
	"OpenQ-Synpress"
	"OpenQ-DRM"
	"OpenQ-Workflows"
)

for repo in "${repos[@]}"; do
	echo -e "\n${BBlue}$repo${Color_Off}"
	clone "$repo"
	generate_dot_env "$repo"
done
