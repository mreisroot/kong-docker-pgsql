#!/bin/sh

# Clear screen
clear

# Create the kong-net network if it doesn't exist
if ! docker network ls | grep kong; then
 docker network create kong-net
else
  printf "The kong-net network already exists\nSkipping..."
  sleep 1
fi

# Deploy the stack
docker compose up
