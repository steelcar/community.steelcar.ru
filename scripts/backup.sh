#!/usr/bin/env bash
SCRIPTS_DIR=$( cd ${0%/*} && pwd -P ); . ${SCRIPTS_DIR}/lib/loader.sh;

import lib/aws

set -e
source ${PWD}/env/.aws-s3-backup.env

export COMPOSE_FILE=docker-compose.admin.yml

aws --version

aws_s3_backup \
    ${PWD}/data \
    s3://${AWS_S3_BUCKET} \
    --exclude=* \
    --include=redis/*  \
    --include=nodebb/*  \
    --include=nginx/cache/*  \
    --delete
