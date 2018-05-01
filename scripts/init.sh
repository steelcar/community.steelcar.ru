#!/usr/bin/env bash
SCRIPTS_DIR=$( cd ${0%/*} && pwd -P ); . ${SCRIPTS_DIR}/lib/loader.sh;

import lib/format
import lib/version
import lib/dotenv
import lib/nodebb

set -e
source ${PWD}/env/.registry.env
source ${PWD}/env/.sshd.env

if [ -f ${PWD}/.env ]; then
   echo "Already initialized"
   exit 0
fi


echo -e "\n${TITLE_FORMAT}Init .env${RESET_FORMAT}\n"

dotenv_clear
dotenv_add COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
dotenv_add VERSION=$(version_current ${PWD}/.version)
dotenv_add YARN_CACHE_DIR=data/.cache/yarn
dotenv_add DOCKER_REGISTRY_URI=${DOCKER_REGISTRY_URI}
dotenv_add SSHD_PUBLIC_PORT=${SSHD_PUBLIC_PORT}


echo -e "\n${TITLE_FORMAT}Start redis${RESET_FORMAT}\n"
docker-compose up -d redis


echo -e "\n${TITLE_FORMAT}Start sshd${RESET_FORMAT}\n"
docker-compose up -d sshd


echo -e "\n${TITLE_FORMAT}Init nodebb${RESET_FORMAT}\n"
git submodule update --init
nodebb-exec yarn


echo -e "\n${TITLE_FORMAT}Start nodebb${RESET_FORMAT}\n"
docker-compose up -d nodebb


echo -e "\n${TITLE_FORMAT}Start nginx${RESET_FORMAT}\n"
docker-compose up -d nginx
