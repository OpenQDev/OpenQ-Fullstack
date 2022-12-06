#!/bin/bash

# Shutdown Redis
redis-cli -p 6379 SHUTDOWN

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# START
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

redis-server --port 6379 --daemonize yes
mongod --port 27018 --dbpath ./data/db --fork --replSet rs0 --logpath ./data/db/mongod.log
