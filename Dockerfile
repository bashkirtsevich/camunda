FROM java:8
LABEL maintainer="D.A.Bashkirtsev -- bashkirtsevich@gmail.com"

WORKDIR /camunda

# Deployment environment variables
ENV NEXUS=https://app.camunda.com/nexus/service/local/artifact/maven/redirect
ENV DISTRO=tomcat
ENV VERSION=7.8.0
ENV SERVER=apache-tomcat-8.0.47
ENV LIB_DIR=/camunda/lib/
ENV SERVER_CONFIG=/camunda/conf/server.xml

# Deployment
RUN wget -O - "${NEXUS}?r=public&g=org.camunda.bpm.${DISTRO}&a=camunda-bpm-${DISTRO}&v=${VERSION}&p=tar.gz" | tar xzf - -C /camunda/ server/${SERVER} --strip 2
RUN wget -O "${LIB_DIR}/postgresql-42.2.1.jar" "https://jdbc.postgresql.org/download/postgresql-42.2.1.jar"
RUN chmod a+rwx -R /camunda

ADD bin/* /camunda/bin/
ADD conf/server.xml ${SERVER_CONFIG}

# Startup environment variables
ENV DB_DRIVER=org.postgresql.Driver
ENV DB_URL=postgresql://postgresql:5432
ENV DB_USER=camunda
ENV DB_PASSWORD=camunda

EXPOSE 8080

CMD [ "/camunda/bin/catalina.sh", "run" ]