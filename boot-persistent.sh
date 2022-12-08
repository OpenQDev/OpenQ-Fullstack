#!/bin/bash

# Shutdown Redis
redis-cli -p 6379 SHUTDOWN

# Shutdown MongoDB

# Shutdown containers
echo -e ${Cyan}"Starting all OpenQ containers from scratch..."${Color_Off}
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
echo -e ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# START
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

redis-server --port 6379 --daemonize yes
mongod --port 27018 --dbpath ./data/db --fork --replSet rs0 --logpath ./data/db/mongod.log

docker run --name ipfs -p 5001:5001 -d ipfs/go-ipfs:v0.10.0

docker run --name postgres -p 5432:5432 -e POSTGRES_USER=graph-node -e POSTGRES_PASSWORD=let-me-in -e POSTGRES_DB=graph-node -d postgres -cshared_preload_libraries=pg_stat_statements

docker run --name ethnode -p 8545:8545 -d openq/openq-json-rpc-node:latest
