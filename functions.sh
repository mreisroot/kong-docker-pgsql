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

# Function that exports Kong Data
export_data() {
  # Create kong_data directory if it doesn't exist
  if [ ! -d ./kong_data ]; then
    mkdir kong_data
  else
    printf "The kong_data directory already exists\nSkipping...\n"
    sleep 1
  fi

  # Export configuration
  printf "\nExporting configuration...\n"
  curl -X GET http://localhost:8001/config > kong_data/kong_config.yml
  sleep 1

  # Export services
  printf "\nExporting services...\n"
  curl -X GET http://localhost:8001/services > kong_data/services.json
  sleep 1

  # Export routes
  printf "\nExporting routes...\n"
  curl -X GET http://localhost:8001/routes > kong_data/routes.json
  sleep 1

  # Export plugins
  printf "\nExporting plugins...\n"
  curl -X GET http://localhost:8001/plugins > kong_data/plugins.json
  sleep 1

  # Export consumers
  printf "\nExporting consumers...\n"
  curl -X GET http://localhost:8001/consumers > kong_data/consumers.json
  sleep 1

  # Export key-auths
  printf "\nExporting key-auths...\n"
  curl -X GET http://localhost:8001/key-auths > kong_data/key-auths.json
  sleep 1
}

# Function that imports Kong Data
import_data() {
  # Import configuration
  printf "\nImporting configuration...\n"
  curl -X POST http://localhost:8001/config < kong_data/kong_config.yml
  sleep 1

  # Import services
  printf "\nImporting services...\n"
  curl -X POST http://localhost:8001/services < kong_data/services.json
  sleep 1

  # Import routes
  printf "\nImporting routes...\n"
  curl -X POST http://localhost:8001/routes < kong_data/routes.json
  sleep 1

  # Import plugins
  printf "\nImporting plugins...\n"
  curl -X POST http://localhost:8001/plugins < kong_data/plugins.json
  sleep 1

  # Import consumers
  printf "\nImporting consumers...\n"
  curl -X POST http://localhost:8001/consumers < kong_data/consumers.json
  sleep 1

  # Import key-auths
  printf "\nImporting key-auths...\n"
  curl -X POST http://localhost:8001/key-auths < kong_data/key-auths.json
  sleep 1
}
