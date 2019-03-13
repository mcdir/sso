# [Signing & Encryption](https://apereo.github.io/cas/5.2.x/installation/Configuration-Properties-Common.html#signing--encryption)

    wget https://raw.githubusercontent.com/apereo/cas/master/etc/jwk-gen.jar
    #java -jar jwk-gen.jar -t oct -s [size]
    java -jar jwk-gen.jar -t oct -s 4096
    
RSA Keys
Certain features such as the ability to produce JWTs as CAS tickets may allow you to use the RSA algorithm with public/private keypairs for signing and encryption. This behavior may prove useful generally in cases where the consumer of the CAS-encoded payload is an outsider and a client application that need not have access to the signing secrets directly and visibly and may only be given a half truth vis-a-vis a public key to verify the payload authenticity and decode it. This particular option makes little sense in situations where CAS itself is both a producer and a consumer of the payload.

Remember
Signing and encryption options are not mutually exclusive. While it would be rather nonsensical, it is entirely possible for CAS to use AES keys for signing and RSA keys for encryption, or vice versa.

In order to enable RSA functionality for signing payloads, you will need to generate a private/public keypair via the following sample commands:

```bash
openssl genrsa -out private.key 4096
openssl rsa -pubout -in private.key -out public.key -inform PEM -outform DER

JWT_PATH=./jwt
JWT_PASSPHRASE=123456
JWT_SECRET_KEY_PATH=./
mkdir -p ${JWT_PATH}
cd ${JWT_PATH}
openssl genrsa -passout pass:${JWT_PASSPHRASE} -out ${JWT_SECRET_KEY_PATH} -aes256 4096
openssl rsa -passin pass:${JWT_PASSPHRASE} -pubout -in ${JWT_SECRET_KEY_PATH} -out ${JWT_PUBLIC_KEY_PATH}
cd ..
chmod -R 444 ${JWT_PATH}/
echo 'JWT files generated successfully'
```
