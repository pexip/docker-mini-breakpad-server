#!/bin/bash

SYMBOLS_URL=https://github.com/pexip/docker-mini-breakpad-server/releases/download/symbols/symbols.tar.gz
# curl $SYMBOLS_URL | tar xz
if [ -d pool ]
    then
        echo "Not downloading symbols: pool present"
    else
        echo "Downloading nw.js symbols"
        curl -L $SYMBOLS_URL | tar xz
fi

docker build -t pexip/mini-breakpad-server docker
docker run --rm -it -v `pwd`/pool:/home/nvm/mini-breakpad-server/pool -P pexip/mini-breakpad-server
