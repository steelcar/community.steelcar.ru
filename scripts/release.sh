#!/usr/bin/env bash
SCRIPTS_DIR=$( cd ${0%/*} && pwd -P ); . ${SCRIPTS_DIR}/lib/loader.sh;

import lib/docker
import lib/format
import lib/version

set -e
set -o allexport; source ${PWD}/env/.registry.env; set +o allexport

if [ "${@#nodebb}" == "$@" ] || [ -z "$1" ];
then
    echo "${TITLE_FORMAT}"
    echo "========================================================"
    echo "|  build nodebb statics                                 "
    echo "========================================================"
    echo -n "${RESET_FORMAT}"
    COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
    docker-compose down
    docker-compose up -d redis
    docker-compose run --rm nodebb ./nodebb build
    docker-compose down
fi


export COMPOSE_FILE=docker-compose.yml:docker-compose.prod.yml:docker-compose.build.yml
export VERSION=$(version_patch ${PWD}/.version)
docker-compose down

echo "${TITLE_FORMAT}"
echo "========================================================"
echo "|  build docker images                                  "
echo "========================================================"
echo -n "${RESET_FORMAT}"

dc_build $@


echo "${TITLE_FORMAT}"
echo "========================================================"
echo "|  push docker images                                   "
echo "========================================================"
echo -n "${RESET_FORMAT}"

dc_push $@
