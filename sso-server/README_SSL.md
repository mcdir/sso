# Certificate generation (refer to this document when ssl is enabled)

##Generation steps
The meaning of each parameter:
  * -genkeypair generates a key
  * -keyalg specifies the key algorithm, then specify RSA,
  * -keysize specifies the key length. The default is 1024 bits. Specify 2048 here, longer, I can't crack it (haha...),
  * -siglag specifies the digital signature algorithm, specified here as the SHA1withRSA algorithm
  * -validity specifies the validity period of the certificate. Here is 36500 days, which is 100 years. I think my application will not take so long.
  * -alias specifies the alias, here is cas.server.com
  * -keystore specifies the keystore storage location, where there is a d drive
  * -dname specifies the user information, no need to answer its question one by one;

Note: CN=domain name, we use `passport.sso.com`
1.
```cmd
Keytool -genkeypair -keyalg RSA -keysize 2048 -sigalg SHA1withRSA -validity 36500 -alias passport.sso.com -keystore d:/tomcat.keystore -dname "CN=passport.sso.com,OU=sunrizetech,O=esaleb,L =GuangZhou,ST=GuangDong,C=CN"
# Enter the above command, the following password we enter 123456, and then press Enter, the tomcat.keystore file is generated on the d drive;
```

2. Export digital certificate
  Enter the following command under cmd:
```cmd
Keytool -exportcert -alias passport.sso.com -keystore d:/tomcat.keystore -file d:/tomcat.cer -rfc
```

3. Import the server's certificate tomcat.cer into the cacerts certificate store of the client java.
Cmd to `${JAVA_HOME}jre\lib\security`

Run the following command:
```cmd
Keytool -import -alias passport.sso.com -keystore %JAVA_HOME%\jre\lib\security\cacerts -file d:/tomcat.cer -trustcacerts
#密码为changeit
```

4. Check if the import is successful
```cmd
Keytool -list -keystore "%JAVA_HOME%\jre\lib\security\cacerts" | findstr/i server
```
```bash
keytool -list -keystore "$JAVA_HOME\jre\lib\security\cacerts" | grep server
```

Something outputs represent success
