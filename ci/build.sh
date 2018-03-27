#!/usr/bin/env bash
set -ex

export GOPATH=$PWD/build-src

OUTPUT=${PWD}/build-files

go get -v github.com/bitly/oauth2_proxy
go build -v -ldflags='-s -w' -o ${OUTPUT}/oauth2_proxy github.com/bitly/oauth2_proxy
