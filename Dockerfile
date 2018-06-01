FROM sonarqube:7.1
#ENV ldap_PASSWD=""


WORKDIR /opt/sonarqube/extensions/plugins
RUN wget http://sonarsource.bintray.com/Distribution/sonar-ldap-plugin/sonar-ldap-plugin-2.2.0.608.jar
#RUN cp /opt/sonarqube/conf/sonar.properties /opt/sonarqube/conf/sonar.properties.orig
COPY ./sonar.properties /opt/sonarqube/conf/
WORKDIR $SONARQUBE_HOME



