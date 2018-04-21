#!/usr/bin/env bash
[ -n "${LIB_ASSERT}" ] && return || readonly LIB_ASSERT=1

import lib/format

assert_ok () {
    if [[ -z ${!1} ]]
    then
        echo "${ERROR_FORMAT}${2}${RESET_FORMAT}"
        exit 1
    fi
}

assert_file_exists () {
    if [ ! -f ${1} ]; then
        echo "${ERROR_FORMAT}${2}${RESET_FORMAT}"
        exit 1
    fi
}
