#!/bin/bash

docker run --rm -it -v `pwd`/pool:/home/nvm/mini-breakpad-server/pool -P sporsh/mini-breakpad-server
