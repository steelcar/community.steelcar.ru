#!/usr/bin/env bash
[ -n "${LIB_NODEBB}" ] && return || readonly LIB_NODEBB=1

nodebb-exec () {
    docker-compose run --rm --entrypoint='' nodebb $@
}
