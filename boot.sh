source asciiart.sh

echo ${Cyan}"Removing OpenQ Fullstack containers from previous run..."${Color_Off}

# Stop and remove containers listed in the specified docker-compose file
docker-compose -f ./docker-compose.yml down

echo ${Cyan}"Removed stale OpenQ containers. Booting new..."${Color_Off}

COMPOSE_HTTP_TIMEOUT=200 docker-compose -f ./docker-compose.yml up
