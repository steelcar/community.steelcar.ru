#!/usr/bin/env bash
SCRIPTS_DIR=$( cd ${0%/*} && pwd -P ); . ${SCRIPTS_DIR}/lib/loader.sh;

import lib/format
import lib/version
import lib/dotenv

set -e
set -o allexport; source ${PWD}/env/.registry.env; set +o allexport
source ${PWD}/env/.sshd.env

if [ -f ${PWD}/.env ]; then
   docker-compose down
fi

if [[ "${@#dev}" == "$@" ]]
then
    echo -e "\n${TITLE_FORMAT}Environment: ${SUBTITLE_FORMAT}production ${RESET_FORMAT}\n"

    dotenv_clear
    dotenv_add COMPOSE_FILE=docker-compose.yml:docker-compose.prod.yml
    dotenv_add VERSION=$(version_current ${PWD}/.version)
    dotenv_add DOCKER_REGISTRY_URI=${DOCKER_REGISTRY_URI}
    dotenv_add SSHD_PUBLIC_PORT=${SSHD_PUBLIC_PORT}

    docker-compose pull
else
    echo -e "\n${TITLE_FORMAT}Environment: ${SUBTITLE_FORMAT}development ${RESET_FORMAT}\n"

    dotenv_clear
    dotenv_add COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
    dotenv_add VERSION=$(version_current ${PWD}/.version)
    dotenv_add YARN_CACHE_DIR=data/.cache/yarn
    dotenv_add DOCKER_REGISTRY_URI=${DOCKER_REGISTRY_URI}
    dotenv_add SSHD_PUBLIC_PORT=${SSHD_PUBLIC_PORT}
fi

docker-compose up -d nginx
docker-compose up -d
