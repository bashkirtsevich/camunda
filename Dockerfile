FROM java:8

ENV VERSION 7.8.0
ENV DISTRO tomcat
ENV SERVER apache-tomcat-8.0.47
ENV LIB_DIR /camunda/lib/
ENV SERVER_CONFIG /camunda/conf/server.xml
ENV NEXUS https://app.camunda.com/nexus/service/local/artifact/maven/redirect

WORKDIR /camunda

# add camunda distro
RUN wget -O - "${NEXUS}?r=public&g=org.camunda.bpm.${DISTRO}&a=camunda-bpm-${DISTRO}&v=${VERSION}&p=tar.gz" | tar xzf - -C /camunda/ server/${SERVER} --strip 2
# add scripts
ADD bin/* /usr/local/bin/
# add database drivers
# RUN /usr/local/bin/download-database-drivers.sh "${NEXUS}?r=public&g=org.camunda.bpm&a=camunda-database-settings&v=${VERSION}&p=pom"
# set folder writeable
RUN chmod a+rwx -R /camunda

EXPOSE 8080

CMD ["/usr/local/bin/configure-and-run.sh"]