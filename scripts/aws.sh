#!/usr/bin/env bash

export COMPOSE_FILE=docker-compose.admin.yml

docker-compose run --rm aws $@
