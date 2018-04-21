#!/usr/bin/env bash
[ -n "${LIB_DOCKER}" ] && return || readonly LIB_DOCKER=1

import lib/assert
import lib/format

dc_build() {
    assert_ok COMPOSE_FILE "Error: Environment variable COMPOSE_FILE is undefined"
    assert_ok DOCKER_REGISTRY_URI "Error: Environment variable DOCKER_REGISTRY_URI is undefined"
    assert_ok VERSION "Error: Environment variable VERSION is undefined"

    if [ -z "$1" ]
    then
        for service in $(docker-compose config --services)
        do
            echo -e "\n${SUBTITLE_FORMAT}docker-compose build ${service} ${RESET_FORMAT}\n"
            docker-compose build ${service}
        done
    else
        for service in $@
        do
            echo -e "\n${SUBTITLE_FORMAT}docker-compose build ${service} ${RESET_FORMAT}\n"
            docker-compose build ${service}
        done
    fi
}

dc_push() {
    assert_ok COMPOSE_FILE "Error: Environment variable COMPOSE_FILE is undefined"
    assert_ok DOCKER_REGISTRY_URI "Error: Environment variable DOCKER_REGISTRY_URI is undefined"
    assert_ok VERSION "Error: Environment variable VERSION is undefined"

    if [ -z "$1" ]
    then
        for service in $(docker-compose config --services)
        do
            echo -e "\n${SUBTITLE_FORMAT}docker-compose push ${service} ${RESET_FORMAT}\n"
            docker-compose push ${service}
        done
    else
        for service in $@
        do
            echo -e "\n${SUBTITLE_FORMAT}docker-compose push ${service} ${RESET_FORMAT}\n"
            docker-compose push ${service}
        done
    fi
}
