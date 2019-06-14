#FROM openjdk:8-jdk-alpine
FROM java 
VOLUME /tmp
ARG DEPENDENCY_FEP=library/fep/target
ARG DEPENDENCY_APP=examples/app/fep_app_simple/target
COPY ${DEPENDENCY_FEP} /app
COPY ${DEPENDENCY_APP} /app
COPY scripts/runFepAppSimple.sh /app
COPY ./redis-server_Linux /app
EXPOSE 8080
ENTRYPOINT java -version ; ls -al /app ; whereis java ; /app/redis-server_Linux --daemonize yes ; java -jar /app/fep_app_simple-*.jar
