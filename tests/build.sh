#!/usr/bin/env bash
cp 5/alpine/* .
docker buildx build . --output type=docker,name=elestio4test/ghost:latest | docker load
