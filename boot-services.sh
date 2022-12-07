#!/bin/bash

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TEARDOWN
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Clear all service ports
declare -a ports=(
	4000
	3000
	3005
	3008
	8081
	8075
)

echo "Clearing ports..."
for port in "${ports[@]}"; do
	lsof -i tcp:"$port" | awk 'NR!=1 {print $2}' | xargs kill -9
done
echo "Ports all clear!"

# Boot microservices
yarn workspace OpenQ-Frontend boot:local &
yarn workspace OpenQ-API start:dev &
yarn workspace OpenQ-Bounty-Actions-Autotask start:dev &
yarn workspace OpenQ-CoinAPI start:local &
yarn workspace OpenQ-Event-Listener start:dev &
yarn workspace OpenQ-Event-Github-OAuth-Server start:dev &
yarn workspace OpenQ-Oracle start:dev &
yarn workspace OpenQ-Token-Price-Cron-Job start:dev &
yarn workspace OpenQ-User-Registration start:dev
