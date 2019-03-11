#!/bin/bash
export JAVA_HOME=/opt/jre-home
export PATH=$PATH:$JAVA_HOME/bin:.
exec java -jar /usr/local/service/sso-config/target/sso-config.jar &

sleep 1s
exec java -jar ./sso-monitor/target/sso-monitor.jar  &

sleep 30s
exec java -jar /usr/local/service/sso-server/target/cas.war &

sleep 3s
exec java -jar ./sso-management/target/cas-management.war