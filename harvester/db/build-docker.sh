#!/bin/bash

cp -a ../../sql .
docker build -t mariadb10-11-pica:latest .
