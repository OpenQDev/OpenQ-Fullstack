#!/bin/bash
. ./colors.sh

if [ -f "./nohup.out" ]
then
    rm ./nohup.out    
fi

if [[ $1 == "build" ]]
then
    docker-compose up --build
else
    docker-compose up
fi