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
								"OpenQ-Documentation"
								"OpenQ-Bounty-Actions-Autotask"
								"OpenQ-Event-Listener"
								"OpenQ-Token-Price-Cron-Job"
								"Superfluid-Subgraph"
                )

echo 'CAREFUL THIS SCRIPT STASHES ALL REPOS'

for repo in "${repos[@]}"
do
   cd "$repo"
	 git status
	 git stash 
	 git pull
	 echo "Pulled $repo"
	 cd ..
done
