FROM sonarqube:7.1
WORKDIR /opt/sonarqube/extensions/plugins
RUN curl http://sonarsource.bintray.com/Distribution/sonar-ldap-plugin/sonar-ldap-plugin-2.0.jar
WORKDIR $SONARQUBE_HOME



