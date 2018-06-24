#!/usr/bin/env bash

docker run -it -p80:8080 -p50000:50000 -v $PWD/.jenkins:/home/jenkins/.jenkins --name jenkins amasucci/jenkins:latest
