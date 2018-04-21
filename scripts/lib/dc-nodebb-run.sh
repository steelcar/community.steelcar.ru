#!/usr/bin/env bash

dc-nodebb-run () {
    docker-compose run --rm --entrypoint='' --user $(id -u):$(id -g) nodebb $@
}
