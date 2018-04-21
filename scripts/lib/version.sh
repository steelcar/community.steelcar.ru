#!/usr/bin/env bash
[ -n "${LIB_VERSION}" ] && return || readonly LIB_VERSION=1

import lib/assert

version_patch (){
    version_file=${1}
    version_number=$(cat ${1})

    assert_file_exists ${1} "Error: Version file ${version_file} not found"

    ${SCRIPTS_DIR}/vendor/semver bump patch ${version_number} > ${version_file}
    cat ${version_file}
}

version_current () {
    cat ${1}
}
