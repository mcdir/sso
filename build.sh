#!/usr/bin/env bash

mkdir -p ./.trash/mongodb-persistence
chmod 777 ./.trash/mongodb-persistence

# build all and install
mvn clean
#mvn package
mvn install
