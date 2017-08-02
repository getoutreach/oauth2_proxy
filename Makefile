version := $(shell cat VERSION | tr -d "\n")
default: build
build:
	go build
release: build
	fpm -s dir -t deb --name oauth2_proxy --prefix /opt/oauth2_proxy/ --version $(version) oauth2_proxy
push:
	aws s3 cp oauth2-proxy_$(version)_amd64.deb s3://outreach-builds/oauth2-proxy/
