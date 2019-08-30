version := $(shell awk -F'"' '/^const VERSION/ {printf "%s", $$2}' version.go)
deb_pkg := oauth2-proxy_$(version)_amd64.deb

default: build

build:
	echo "Building oauth2_proxy v$(version)"
	CGO_ENABLED=0 go build -ldflags="-s -w" -o oauth2_proxy || exit 1