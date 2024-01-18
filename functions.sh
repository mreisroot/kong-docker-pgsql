#!/bin/sh

# Function that deploys the Kong Stack
deploy() {
  # Clear screen
  clear

  # Create the kong-net network if it doesn't exist
  if ! docker network ls | grep kong; then
   docker network create kong-net
  else
    printf "The kong-net network already exists\nSkipping...\n"
    sleep 1
  fi
  
  # Deploy the stack
  docker compose up
}

# Function that destroys the stack
destroy() {
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
}

# Function that destroys the stack and clears data
destroy_clear_data() {
  # Clear screen
  clear

  # Destroy the stack and its volumes
  docker compose down -v
  
  # Remove the kong-net network
  if docker network ls | grep kong-net; then
    docker network rm kong-net
  else
    echo "The kong-net network was already removed"
    sleep 1
  fi
}
