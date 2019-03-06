# [SSO](https://kawhii.github.io/sso/index.html) 
[![Build Status](https://travis-ci.org/kawhii/sso.svg?branch=master)](Https://travis-ci.org/kawhii/sso) 
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/kawhii/sso/master/LICENSE) 
[![GitHub issues](https://img.shields.io/github/issues/kawhii/sso.svg)](https://github.com/kawhii/Sso/issues)

# Create a single sign-on platform that includes the following subsystems

* CAS SERVER
* Configuration Center
* Service Management System
* monitoring platform
* Client integration (cas client, pac4j, shiro)

And in the blog to record the entire build process and considerations, the current tutorial is as follows:

[current tutorial](http://img.blog.csdn.net/20171129213711953?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMDQ3NTA0MQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
[Monitor System](http://img.blog.csdn.net/20171115154701467?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMDQ3NTA0MQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

# Characteristic

* Docker Quick Launch
* GitHub authorized login
* Cas Clint, Shiro Pac4j Client integration
* jdbc user password encryption
* Custom theme
* Configure unified management
* Iterate according to the new version of the official website 5.1.x
* Publish blog tutorials at various stages
* Password management
* one-button start
* Third-party login access (QQ, WeChat, CSDN, GitHub)
* Bind user
* Verification code output
* Custom checker
* Multi-attribute return
* Verification code transmission, verification (registered to send mailbox verification code)
* Service monitoring and testing
* Check code login
* Single user login

## Tutorial: [![Csdn Blog Tutorial](https://img.shields.io/badge/csdn%20blog-tutorial-orange.svg)](http://blog.csdn.net/u010475041/article/Category/7156505)

* [Blog](http://blog.csdn.net/u010475041/article/category/7156505)
* [Support](https://github.com/kawhii/sso/wiki)

Domain name: localhost

user:

| Username | Password | Is it logged in | Notes |
|:-------|:-------|:-------|:-------|
|admin|123|√||
|zhangsan|12345678|√||
|zhaosi|1234|×|Disabled|
|wangwu|12345|√|Change password|


---

### [Docker Quick Launch](https://hub.docker.com/r/kawhii/sso/)

* Currently only the configuration center and cas services are deployed to the docker environment*

```cmd
Docker run -d --restart=always -p 8443:8443 kawhii/sso
```

```bash
docker run -d --restart=always -p 8443:8443 kawhii/sso
```

If you start with docker, the access is: http://dockerip:8443/cas

# Update config 
```bash
docker cp ./sso-config/src/main/resources/config/sso-dev.properties china-sso-test:/usr/local/service/sso-config/src/main/resources/config/sso-dev.properties
docker cp mycontainer:/foo.txt foo.txt
```

### attention
* Since the password change function is currently sent to the author's mailbox, if it is adjusted, you need to modify `sso-server/src/main/resources/profile/dev/sql/data-dev.sql`
* Password modification function can turn off the question answer function

## Module Introduction

|Module Name| Module Introduction| Port Status| Must Be https|path|Start Sequencing |
|:----------|:-------------------|:-----------|:-------------|:---|:---|
|sso-server|cas|8443|√|cas|2|
|sso-config|Configuration Center|8888|×|config|1|
|sso-management|service management|8081|×|cas-management|3|
|sso-cas-client-demo|cas-client-demo|8080|×|/sample|4|
|sso-client-shiro-demo|shiro-client-demo|8083|×|/|5|
|sso-client-proxy-demo|OAuth2 proxy forwarding client|8808|×|/|6|
|sso-monitor|Monitoring Services|8444|×|/|7|

## Code Download 
[![Code Cloud](https://img.shields.io/badge/download-codecloud-yellowgreen.svg)](https://git.oschina.net/Kawhi-Carl/sso) 
[![Github](https://img.shields.io/badge/download-GitHub-brightgreen.svg)](https://github.com/kawhii/sso)

1. Each stage will be sealed with a tag, and the required [Download](https://github.com/kawhii/sso/releases)
2. The original build file exists in the original-files directory.

## Development 
[![Dependency Status](https://www.versioneye.com/user/projects/59b6afd60fb24f004e1a656b/badge.svg?style=flat-square)](https://www.versioneye.com/user/Projects/59b6afd60fb24f004e1a656b) 
[![codebeat badge](https://codebeat.co/badges/4b430ffd-0cb8-4310-b081-955a66e65c76)](https://codebeat.co/projects/github-com-laomazi2006-sso-master)

* jdk8
* maven3

### Help
```cmd
Build.cmd help
```
Output the following help information
```cmd
"Usage: build.bat [help|sso-server|sso-management|sso-config|cas-client-demo|shiro-client-demo|run-all|hosts]"
1. sso-config: Config Server
2. sso-server: CAS Server
3. sso-management: Cas Management
4. cas-client-demo: CasClient Demo
5. shiro-client-demo: ShiroDemo
6. run: Run all server
7. init: set '127.0.0.1 passport.sso.cm' to HOSTS, import cert to D:\soft\work\java\jdk1.8-144\jre\lib\security\cacerts
```

### Initialization

<!--
1. Responsible for setting `passport.sso.com` to the host file
2. Import the domain name self-signed certificate into the java environment (prompt information, the first need to enter the password is **123456**, the second import password is **changeit**)
 -->

```cmd
Build.cmd init
```

### Start service

> Due to the large number of startup services, the CPU is occupied and the content is slightly higher.

```cmd
Build.cmd run
```
### Http:

* sso-config [Configuration Center](http://localhost:8888/config)
* sso-server [single sign-on service](http://localhost:8443/cas)
* dashboard  [dashboard](http://localhost:8443/cas/status/dashboard)
* cas-client-demo [cas client](http://localhost:8080/sample)
* shiro-client-demo [shiro client](http://localhost:8083)
* sso-management [service management client](http://localhost:8081/cas-management)
* sso-monitor [service monitoring](http://localhost:8444)

### https

* sso-config [Configuration Center](https://passport.sso.com:8888/config)
* sso-server [single sign-on service](https://passport.sso.com:8443/cas)
* dashboard  [dashboard](https://passport.sso.com:8443/cas/status/dashboard)
* cas-client-demo [cas client](https://passport.sso.com:8080/sample)
* shiro-client-demo [shiro client](https://passport.sso.com:8083)
* sso-management [service management client](https://passport.sso.com:8081/cas-management)
* sso-monitor [service monitoring](http://passport.sso.com:8444)


# SSL
[install keystore-explorer](https://keystore-explorer.org/downloads.html)

keytool -genkey -keyalg RSA -alias cas -keystore ./tomcat.keystore -storepass 123456 -validity 9999 -keysize 2048 -dname "cn=passport.sso.com, ou=MyOU, o=MyCompany, c=EN, st=Nord, l=MyCity" 
keytool -genkey -keyalg RSA -alias cas -keystore ./cacerts -storepass changeit -validity 9999 -keysize 2048 -dname "cn=passport.sso.com, ou=MyOU, o=MyCompany, c=EN, st=Nord, l=MyCity"
![example](sso-server/build.sh)
pass 123456
keytool -import -alias passport.sso.com -keystore "%JAVA_HOME%/jre/lib/security/cacerts" -file tomcat.cer -trustcacerts
keytool -import -alias passport.sso.com -keystore "/usr/lib/jvm/java-8-oracle/jre/lib/security/cacerts" -file ./tomcat.cer -trustcacerts



```cmd
# server-id is the name of each service above,
# Such as Start sso-management, build.cmd sso-management

Build.cmd [server-id]
```

# Test

    mvn -Dtest=* test

# overlays

[cas-overlay-template](https://github.com/apereo/cas-overlay-template)
[cas-management-overlay](https://github.com/apereo/cas-management-overlay)
[cas-configserver-overlay](https://github.com/apereo/cas-configserver-overlay)

# apache
[mod_auth_cas](https://github.com/apereo/mod_auth_cas)

# client sdk
[phpCAS](https://github.com/apereo/phpCAS)


# Contact information

If the technical exchange or question can be contacted or an issue can be made.

E-mail: huang.wenbin@foxmail.com


QQ: 756884434 (please specify: SSO-github)

> If the project has technical improvement, work help or some inspiration, please feel free to invite a small cup of coffee, Xiaobian will be full of passion to explain and output blog posts.

WeChat
<img src="http://img.blog.csdn.net/20170908092906735?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMDQ3NTA0MQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast " width="230" height="230"/>
Alipay
<img src="http://img.blog.csdn.net/20170908100804669?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxMDQ3NTA0MQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast " width="230" height="230"/>


