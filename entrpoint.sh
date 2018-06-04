#!/bin/bash
sed -i 's/ldap.bindPassword=/ldap.bindPassword='"$LDAP_PASSWD"'/' /opt/sonarqube/conf/sonar.properties
$SONARQUBE_HOME/bin/run.sh
