#!/bin/bash

set -e

# Create .env file with UID and GID
echo "UID=$(id -u)" > .env
echo "GID=$(id -g)" >> .env

docker-compose \
    --env-file .env \
    -f compose-util/docker-compose.yml \
    run --rm \
    cleanup

ls -l build

touch build/test0.txt
touch build/test1.txt
touch build/test2.txt
touch build/test3.txt

ls -l build

sleep 5s

docker-compose \
    --env-file .env \
    -f compose-util/docker-compose.yml \
    run --rm \
    cleanup

ls -l build
