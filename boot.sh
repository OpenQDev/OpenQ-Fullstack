# Save a local file of the openq launched containers for later deletion and removal

echo -e ${Cyan}"Starting all OpenQ containers from scratch..."${Color_Off}
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
echo -e ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

COMPOSE_HTTP_TIMEOUT=200 docker-compose -f docker-compose.yml up
