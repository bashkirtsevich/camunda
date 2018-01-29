# Camunda 
Camunda BPM platform adopted for OpenShift

## Deploying environment variables:
* `NEXUS` -- `https://app.camunda.com/nexus/service/local/artifact/maven/redirect`
* `DISTRO` -- `tomcat`
* `VERSION` -- `7.8.0`
* `SERVER` -- `apache-tomcat-8.0.47`
* `LIB_DIR` -- `/camunda/lib/`
* `SERVER_CONFIG` -- `/camunda/conf/server.xml`

Database connection environment variables (by default):
* `DB_DRIVER` -- `org.postgresql.Driver`
* `DB_URL` -- `postgresql://postgresql:5432`
* `DB_USER` -- `camunda`
* `DB_PASSWORD` -- `camunda`

## Startup:
```
docker pull bashkirtsevich/camunda
docker run -d --network my_network -p 8080:8080 -e DB_URL=postgresql://postgresql:5432/camunda -e DB_USER=scoring -e DB_PASSWORD=scoring --name camunda-test bashkirtsevich/camunda
```
## Use
Open browser and open `http://localhost:8080/camunda/app/welcome/default/#/welcome`

# Hub's
GitHub: https://github.com/bashkirtsevich/camunda

DockerHub: https://hub.docker.com/r/bashkirtsevich/camunda/
