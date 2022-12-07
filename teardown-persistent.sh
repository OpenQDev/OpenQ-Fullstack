#!/bin/bash

# Shutdown Redis
redis-cli -p 6379 SHUTDOWN

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# START
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

redis-server --port 6379 --daemonize yes
mongod --port 27018 --dbpath ./data/db --fork --replSet rs0 --logpath ./data/db/mongod.log

docker run -p 5001:5001 -d ipfs/go-ipfs:v0.10.0
docker run --name postgres -d postgres -cshared_preload_libraries=pg_stat_statements
