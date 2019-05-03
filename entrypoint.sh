#!/bin/bash -eu

[[ -v DEBUG ]] && ${DEBUG} && set -x

case ${1} in
    run)
        bin/hubot -a slack
        ;;
    debug)
        npm install
        export PATH="node_modules/.bin:node_modules/hubot/node_modules/.bin:$PATH"
        coffee --nodejs --inspect=0.0.0.0 node_modules/.bin/hubot --name "Hubot" -a slack
        ;;
    *)
        exec "$@"
        ;;
esac
