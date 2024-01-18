#!/bin/sh

# Clear screen
clear

# Destroy the stack and clear data
docker compose down -v

# Remove the kong-net network
if docker network ls | grep kong-net; then
  docker network rm kong-net
else
  echo "The kong-net network was already removed"
  sleep 1
fi
