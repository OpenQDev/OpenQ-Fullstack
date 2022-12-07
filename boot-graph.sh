echo -e ${Cyan}"Starting all OpenQ containers from scratch..."${Color_Off}
docker stop graph_node && docker rm graph_node
echo -e ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

docker run --name graph_node -e postgres_host=localhost:5432 -e postgres_user=graph-node -e postgres_pass=let-me-in -e postgres_db=graph-node -e ipfs=localhost:5001 -e ethereum=mainnet:http://localhost:8545 graphprotocol/graph-node:latest
