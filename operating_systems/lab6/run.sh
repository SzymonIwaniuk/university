#!/bin/zsh

set -eo pipefail

IMAGE_TAG=siwaniuk/ubuntu-with-c-lab6

docker build . -t $IMAGE_TAG

docker run -it -v $(pwd):/home/ubuntu/src $IMAGE_TAG /bin/bash
