FROM sonarqube:7.1
ENV LDAP_PASSWD=""
ENV PATH $PATH:$SONARQUBE_HOME/bin 
ENV LDAP_CONTAINER_NAME="" 
ENV LDAP_PORT=389

RUN apt-get update && apt-get install -y curl 
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.2.4-amd64.deb
RUN dpkg -i filebeat-6.2.4-amd64.deb
RUN apt-get remove curl -y
WORKDIR /opt/sonarqube/extensions/plugins
RUN wget http://sonarsource.bintray.com/Distribution/sonar-ldap-plugin/sonar-ldap-plugin-2.2.0.608.jar
#RUN cp /opt/sonarqube/conf/sonar.properties /opt/sonarqube/conf/sonar.properties.orig
COPY ./sonar.properties /opt/sonarqube/conf/
COPY filebeat.yml /etc/filebeat/
RUN chmod go-w /etc/filebeat/filebeat.yml
WORKDIR $SONARQUBE_HOME
COPY entrpoint.sh ./bin/
COPY run.sh ./bin/
RUN chmod +x ./bin/*
ENTRYPOINT ["entrpoint.sh"]
