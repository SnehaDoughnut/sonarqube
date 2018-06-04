#!/bin/bash
sed -i 's/ldap.bindPassword=/ldap.bindPassword='"$LDAP_PASSWD"'/' /opt/sonarqube/conf/sonar.properties
sed -i '/ldap.url=ldap:\/\// s/$/'"$LDAP_CONTAINER_NAME"':'"$LDAP_PORT"'/' /opt/sonarqube/conf/sonar.properties
$SONARQUBE_HOME/bin/run.sh
