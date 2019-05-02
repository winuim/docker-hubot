#!/bin/bash -eu

[[ -v DEBUG ]] && ${DEBUG} && set -x

case ${1} in
    run)
        bin/hubot -a slack
        ;;
    *)
        exec "$@"
        ;;
esac
