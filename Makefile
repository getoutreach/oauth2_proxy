version := $(shell awk -F'"' '/^const VERSION/ {printf "%s", $$2}' version.go)
deb_pkg := oauth2-proxy_$(version)_amd64.deb

default: build

build:
	echo "Building oauth2_proxy v$(version)"
	go build -ldflags="-s -w" -o oauth2_proxy || exit 1

package:
	echo "Packaging oauth2_proxy into $(deb_pkg)"
	fpm --verbose -s dir -t deb --name oauth2_proxy --prefix /opt/oauth2_proxy/ --version $(version) oauth2_proxy

release:
	echo "Pushing oauth2_proxy package to S3"
	aws s3 cp $(deb_pkg) s3://outreach-builds/oauth2-proxy/
