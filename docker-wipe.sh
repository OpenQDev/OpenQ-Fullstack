#!/bin/bash

## Stop and Remove All Containers
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)

## Docker System Prune
docker system prune -f --volumes

## Remove All Volumes
docker volume rm $(docker volume ls -q)
