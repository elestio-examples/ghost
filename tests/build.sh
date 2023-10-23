#!/usr/bin/env bash
cp -rf ./5/alpine/* ./
docker buildx build . --output type=docker,name=elestio4test/ghost:latest | docker load
