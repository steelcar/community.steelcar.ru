#!/usr/bin/env bash
[ -n "${LIB_DOTENV}" ] && return || readonly LIB_DOTENV=1

dotenv_clear () {
    touch ${PWD}/.env
    echo -n "" > ${PWD}/.env
}

dotenv_add () {
    echo "${1}" >> ${PWD}/.env
}

dotenv_set () {
    sed -i \
        "s/${1}=.\+$/${1}=${2}/" \
        ${PWD}/.env
}
