#!/usr/bin/env bash

# Prints the image version to be used for the Docker image tag

image=${1:-}
[ -z "${image}" ] && echo "No image supplied" && exit 1

# Get image version
wrapper_version=$(docker run --rm --entrypoint bash "${image}" -c 'echo ${WRAPPER_VERSION}')
