#!/usr/bin/env bash
set -e

dep=/usr/local/bin/dep
wget -q -O $dep https://github.com/golang/dep/releases/download/v0.3.2/dep-linux-amd64
chmod +x $dep

[[ -d ./dist ]] && rm -r ./dist
./dist.sh
