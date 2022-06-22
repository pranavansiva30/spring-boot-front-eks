#!/bin/bash

docker image prune -a --force --filter "label=spring-boot-eks"
docker build -t 486306523629.dkr.ecr.ap-southeast-1.amazonaws.com/spring-boot-front-eks:1.0-SNAPSHOT .
