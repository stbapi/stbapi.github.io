#!/usr/bin/env bash

set -eu

VERSIONS=(
    "v342"
    "v343"
    "v344"
    "v345"
)

for version in ${VERSIONS[@]}; do
    echo $version
    git clone git@gitlab.infomir.com.ua:web/stbapi.git tmp -b $version
    cd tmp

    npm i
    npm run jsdoc:public
    rsync --recursive --delete ./doc/public/ ../$version

    cd ..
    rm -rf ./tmp
done
