version := $(shell awk -F'"' '/^const VERSION/ {printf "%s", $$2}' version.go)
deb_pkg := oauth2-proxy_$(version)_amd64.deb
docker_image := 182192988802.dkr.ecr.us-west-2.amazonaws.com/oauth2_proxy:$(version)

default: build

build:
	echo "Building oauth2_proxy v$(version)"
	go build -ldflags="-s -w" -o oauth2_proxy || exit 1

docker: build
	echo "Building docker image $(docker_image)"
	docker build -t $(docker_image) .

package: build
	echo "Packaging oauth2_proxy into $(deb_pkg)"
	fpm --verbose -s dir -t deb --name oauth2_proxy --prefix /opt/oauth2_proxy/ --version $(version) oauth2_proxy

release:
	echo "Pushing oauth2_proxy package to S2"
	aws s3 cp $(deb_pkg) s3://outreach-builds/oauth2-proxy/
	echo "Pushing oauth2_proxy docker image to ECR"
	docker push $(docker_image)