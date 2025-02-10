#!/bin/bash

docker compose stop
docker compose down
docker ps -aq | xargs docker rm
docker images -aq | xargs docker rmi
rm -rf ./www
