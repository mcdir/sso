#!/usr/bin/env bash

JWT_PATH="./jwt"
JWT_PUBLIC_KEY_PATH="./${JWT_PATH}/public.pem"
JWT_SECRET_KEY_PATH="./${JWT_PATH}/private.pem"
JWT_TOKEN_TTL=3600
JWT_PASSPHRASE=123456

if [[ -d ${JWT_PATH} ]]
then
    echo 'JWT directory already exist, skipping'
else
    mkdir -p ${JWT_PATH}
    echo 'JWT directory created successfully'
fi

if [[ -f ${JWT_SECRET_KEY_PATH} ]]
then
    echo 'JWT files already exist, skipping'
else
    echo ${JWT_SECRET_KEY_PATH}
    #openssl genrsa -passout pass:${JWT_PASSPHRASE} -out ${JWT_SECRET_KEY_PATH} -aes256 4096
    #openssl rsa -passin pass:${JWT_PASSPHRASE} -pubout -in ${JWT_SECRET_KEY_PATH} -out ${JWT_PUBLIC_KEY_PATH}

    #openssl genrsa -out private.key 4096
    #openssl rsa -pubout -in private.key -out public.key -inform PEM -outform DER

    openssl genrsa -out ${JWT_SECRET_KEY_PATH} 4096
    openssl rsa -pubout -in ${JWT_SECRET_KEY_PATH} -out ${JWT_PUBLIC_KEY_PATH} -inform PEM -outform DER
    if [[ -f ${JWT_PATH} ]]
    then
        echo 'JWT files already exist, skipping'
    else
        chmod -R 644 ${JWT_PATH}/*
        chmod 700 ${JWT_PATH}
    fi
    echo 'JWT files generated successfully'
fi
