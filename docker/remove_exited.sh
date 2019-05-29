#!/bin/sh

docker ps -a --format '{{.Names}}\t\t\t{{.Status}}' | grep Exited | awk '{print $1}' | xargs docker rm -v
