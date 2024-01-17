#!/bin/sh

# Clear screen
clear

# Destroy the stack
docker compose down

# Remove the kong-net network
if docker network ls | grep kong-net; then
  docker network rm kong-net
else
  echo "The kong-net network was already removed"
  sleep 1
fi
