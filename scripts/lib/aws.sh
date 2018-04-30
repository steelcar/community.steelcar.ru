#!/usr/bin/env bash
[ -n "${LIB_AWS}" ] && return || readonly LIB_AWS=1

import lib/assert

aws() {
    assert_ok AWS_PROFILE "Error: Environment variable AWS_PROFILE is undefined"
    docker-compose run --rm aws --profile ${AWS_PROFILE} $@
}

aws_ecr_get_login() {
    aws ecr get-login --no-include-email | awk '{print $6}'
}

aws_s3_backup () {
    assert_ok AWS_PROFILE "Error: Environment variable AWS_PROFILE is undefined"

    arg_source=${1}

    docker-compose run --rm \
        -v ${arg_source}:/mnt/data \
        -w /mnt/data \
        aws --profile ${AWS_PROFILE} \
        s3 sync /mnt/data ${@:2}
}
