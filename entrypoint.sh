#!/bin/sh

if [ -n "$DOCKER_ENABLED" ]
then
    echo "DOCKER_ENABLED is set, Installing docker-cli"
    apk add --no-cache docker-cli
    echo "installing docker compose V2"
    mkdir -p ~/.docker/cli-plugins/ 
    wget https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -O ~/.docker/cli-plugins/docker-compose 
    chmod +x ~/.docker/cli-plugins/docker-compose
    docker compose version
fi