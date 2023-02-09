IMAGE_TAG ?= latest
BASEURL ?= https://cerebro.e13.dev

ARCH := $(shell uname -m)
ifeq ($(ARCH),x86_64)
ARCH := amd64
else ifeq ($(ARCH),aarch64)
ARCH := arm64
endif

DOCKER_BUILD_ARGS ?= --load --platform=linux/$(ARCH)

.PHONY: docker-build
docker-build:
	docker buildx build -t ghcr.io/makkes/cerebro:$(IMAGE_TAG) --build-arg BASEURL=$(BASEURL) $(DOCKER_BUILD_ARGS) .

.PHONY: docker-push
docker-push: DOCKER_BUILD_ARGS=--push --platform=linux/amd64,linux/arm64
docker-push: docker-build

.PHONY: deploy-prod
deploy-prod:
	./hack/deploy-prod.sh

.PHONY: serve-local
serve-local:
	hugo -D server
