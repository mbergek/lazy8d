#!/bin/bash

docker compose stop
docker compose down
docker ps | grep lazy8d | awk '{ print $1 }' | xargs docker rm
docker images | grep lazy8d | awk '{ print $3 }' | xargs docker rmi
rm -rf ./www
