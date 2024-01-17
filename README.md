# Local deployment of Kong with PostgreSQL database on Docker

---

## Introduction

In this project, a stack consisting of Kong Gateway, an open source API gateway, and PostgreSQL is deployed on containers using Docker Compose.

---

## Requirements

* [Have Docker installed on your system](https://docs.docker.com/get-docker/)
* Access to Bourne Shell (/bin/sh), Bash, or some other Bourne-compatible shell

---

## Architecture

### Interaction scripts

In this project there are stack interaction scripts:

* `menu.sh` - Interactive menu
* `functions.sh` - Functions used by the menu script
* `up.sh` - Separate script that deploys the stack
* `down.sh` - Separate script that destroys the stack

### Compose file

On the [compose.yml](./compose.yml) file, there are the definitions of the following elements:

* `services.kong-database`: Service that contains the definition of the database container
* `services.kong-bootstrap`: An ephemeral service that initializes the database
* `services.kong-gateway`: Service that contains the definition of the API gateway container
* `networks.kong-network`: The private network in which the containers communicate

---

## How to use this project

### Interactive menu

The easiest way to use the project is through the interactive menu implemented on the [menu.sh](./menu.sh) script, which uses the functions defined in the [functions.sh](./functions.sh) file.

To access the interactive menu, type in a UNIX/Linux terminal:

`./menu.sh`

The menu will present four options:

1. Deploy Stack
2. Destroy Stack
3. Exit

### Separate scripts

If you want a faster way to use the project, consider running the following scripts:

To deploy the Kong container stack:

`./up.sh`

To destroy the Kong container stack:

`down.sh`

### Docker commands

In case of using a system that doesn't have a UNIX shell (e.g. Bourne Shell, Bash) that has Docker installed, like Windows, you can interact with the stack by running Docker commands:

1. Create the kong-net network:

`docker network create kong-net`

2. Deploy the stack:

`docker compose up`

3. Destroy the stack:

`docker compose down`
