#!/bin/bash

CONTAINER_NAME=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONTAINER_REPO=tensorflow/tensorflow:latest-gpu-py3

if [ -z "$CONTAINER_NAME" ]; then
	echo "Please enter argument : Container name"
	exit 1
fi

if [ -z "`docker ps -a -f name=^$CONTAINER_NAME$ | grep $CONTAINER_NAME`" ]; then
	echo "Container not present. Creating new."
	docker run --name $CONTAINER_NAME -v $DIR/tf_sb:/mnt --gpus all -it $CONTAINER_REPO bash
else
	docker start -ai $CONTAINER_NAME	
fi

