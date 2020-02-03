#!/bin/bash

CONTAINER_NAME=$1
if [ -z "$CONTAINER_NAME" ]; then
	echo "Please enter argument : Container name"
	exit 1
fi

while true; do
    read -p "Do you wish to delete this env?(y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done

DOCKER_ID=`docker ps -a -f name=^$CONTAINER_NAME$ | grep $CONTAINER_NAME | awk '{print $1}'`
if [ ! -z "$DOCKER_ID" ]; then
	docker rm $DOCKER_ID
fi