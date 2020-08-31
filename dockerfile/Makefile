all: image tag
.PHONY: all

help:
	@echo 'Goals:'
	@echo '  image    - build a docker image'
	@echo '  tag      - tag the latest image with a version based on its contents'
	@echo '  push     - push a docker image to the locally configured docker repository'
	@echo '  release  - create release tag from latest version'
.PHONY: help

ORG=${VCS}
REPO=$(shell git rev-parse --show-toplevel | xargs basename)

define image-version
$(shell ./image-tag.sh "$(ORG)/$(REPO):latest")
endef

version:
	$(eval VERSION=$(image-version))
.PHONY: version

push: version
	docker push $(VCS)/$(REPO):$(VERSION)
.PHONY: push

image:
	docker build -t $(VCS)/$(REPO):latest .
.PHONY: image

tag: version
	docker tag $(VCS)/$(REPO):latest $(VCS)/$(REPO):$(VERSION)
.PHONY: tag

release: version
	git tag -a "$(VERSION)" -m '$(REPO) version $(VERSION)'
.PHONY: release
