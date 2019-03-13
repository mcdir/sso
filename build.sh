#!/usr/bin/env bash

source ./bashfunc.sh

_java="$(jdk_version)"
_java=$((_java + 0))

echo $_java

if [[ "$_java" -gt 9 ]]; then
    echo "version is more than 9, error !!!"
    exit 1
else
    echo "version is less than 9, is ok"
fi


mkdir -p ./.trash/mongodb-persistence
chmod 777 ./.trash/mongodb-persistence

# build all and install
mvn clean
#mvn package
mvn install
