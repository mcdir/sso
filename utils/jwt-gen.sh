#!/usr/bin/env bash

JWT_SECRET_KEY_PATH="./jwt"
JWT_PATH=./jwt

if [[ -d ${JWT_PATH} ]]
then
    echo 'JWT directory already exist, skipping'
else
    mkdir -m 600 ${JWT_PATH}
    touch ${JWT_PATH}/.gitkeep
    echo 'JWT directory created successfully'
fi

if [[ -f ${JWT_SECRET_KEY_PATH} ]]
then
    echo 'JWT files already exist, skipping'
else
    echo ${JWT_SECRET_KEY_PATH}
    openssl genrsa -passout pass:${JWT_PASSPHRASE} -out ${JWT_SECRET_KEY_PATH} -aes256 4096
    openssl rsa -passin pass:${JWT_PASSPHRASE} -pubout -in ${JWT_SECRET_KEY_PATH} -out ${JWT_PUBLIC_KEY_PATH}
    chmod -R 444 ${JWT_PATH}/*
    echo 'JWT files generated successfully'
fi
