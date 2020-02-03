#!/bin/bash

CONTAINER_NAME=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PYTORCH_VERSION=1.4
CUDA_VERSION=10.1
CUDNN_VERSION=7
CONTAINER_REPO=pytorch/pytorch:$PYTORCH_VERSION-cuda$CUDA_VERSION-cudnn$CUDNN_VERSION-devel

if [ -z "$CONTAINER_NAME" ]; then
	echo "Please enter argument : Container name"
	exit 1
fi

if [ -z "`docker ps -a -f name=^$CONTAINER_NAME$ | grep $CONTAINER_NAME`" ]; then
	echo "Container not present. Creating new."
	docker run --name $CONTAINER_NAME -v $DIR/py_torch_sb:/mnt --ipc=host --gpus all -it $CONTAINER_REPO bash
else
	docker start -ai $CONTAINER_NAME	
fi

