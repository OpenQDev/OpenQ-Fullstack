#!/bin/bash

declare -a repos=(
                "OpenQ-CoinAPI"
								"OpenQ-Oracle"
                "OpenQ-Frontend" 
                "OpenQ-Contracts"
                "OpenQ-Github-OAuth-Server"
								"OpenQ-Graph"
                "OpenQ-Kubeconfig"
								"OpenQ-Bot"
								"OpenQ-API"
								"OpenQ-Architecture"
								"OpenQ-OZ-Claim-Autotask"
								"OpenQ-Bounty-Actions-Autotask"
								"OpenQ-Event-Listener"
								"OpenQ-Token-Price-Cron-Job"
								"Superfluid-Subgraph"
								"OpenQ-Synpress"
								"OpenQ-Notification-Autotask"
								"OpenQ-User-Registration"
								"OpenQ-Email-Server"
								"OpenQ-Helm"
								"OpenQ-Github-Proxy"
								"OpenQ-Document-Manager"
                )

echo 'CAREFUL THIS SCRIPT STASHES ALL REPOS'

for repo in "${repos[@]}"
do
   cd "$repo"
	 git config core.fileMode false
	 echo "Ignored $repo"
	 cd ..
done
