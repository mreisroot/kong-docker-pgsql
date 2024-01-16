# Local deployment of Kong with PostgreSQL database on Docker

---

## Introduction

In this project, an instance of Kong Gateway, an open source API gateway, is deployed with a PostgreSQL database on containers using Docker Compose.

---

## Requirements

[Have Docker installed on your system](https://docs.docker.com/get-docker/)

---

## Architecture

### Compose file

On the [compose.yml](./compose.yml) file, there are the definitions of the following elements:

* `services.kong-database`: Service that contains the definition of the database container
* `services.kong-bootstrap`: An ephemeral service that initializes the database
* `services.kong-gateway`: Service that contains the definition of the API gateway container
* `networks.kong-network`: The private network in which the containers communicate

---

## How to use this project

To deploy Kong, run:

`docker compose up`

To remove the created containers, run:

`docker compose down`
