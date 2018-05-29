FROM sonarqube:7.1
#RUN curl -O /extensions/plugins https://github.com/sonargraph/sonar-sonargraph-integration/releases/download/Release-1.1.4/sonar-sonargraph-integration-1.1.4.jar
#ENTRYPOINT ["/opt/sonarqube/bin/run.sh"]

#ENV LDAP_PLUGIN_VERSION=2.2.0.608
#RUN cd /opt/sonarqube/extensions/plugins/ && curl -sLo ./sonar-ldap-plugin-${LDAP_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-ldap-plugin/sonar-ldap-plugin-${LDAP_PLUGIN_VERSION}.jar



RUN git clone https://github.com/SonarSource/sonar-ldap.git
WORKDIR sonar-ldap
COPY docker/sonar.properties /opt/sonarqube/conf/sonar.properties
COPY sonar-ldap-plugin/target/sonar-ldap-plugin-*-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/

