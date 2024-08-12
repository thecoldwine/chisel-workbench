#!/usr/bin/env bash

CONTAINER_NAME=workbench

while getopts "hc" flag; do
	case $flag in
		h) 
			echo "Usage:  analyze-package-docker.sh [-ch] PACKAGE"
			echo "  Arguments:"
			echo "    PACKAGE - an ubuntu package to analyze"
			echo "    -c - cleanup cached container"
			echo "    -h - display this message"
			return 0
			;;
		c)
			echo "Cleanup requested for container $CONTAINER_NAME"
			docker container rm -f $CONTAINER_NAME
			;;
	esac
done;

docker container ls -a | grep -q $CONTAINER_NAME

if [[ $? -ne 0 ]]; then
	echo "$CONTAINER_NAME does not exist, initialize"
	docker run -d --name $CONTAINER_NAME ubuntu:24.04 tail -f /dev/null
	docker cp ./analyze-package.sh $CONTAINER_NAME:/opt/analyze-package.sh
	docker exec $CONTAINER_NAME apt update
fi

docker exec $CONTAINER_NAME /opt/analyze-package.sh $1
