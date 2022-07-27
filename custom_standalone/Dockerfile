# dockerfile for case 03248346 - setting up custom standalone_config file
FROM jboss-eap-7/eap74-openjdk11-openshift-rhel8
COPY version.txt /opt/eap
RUN mkdir -p /opt/eap/custom-standalone
ADD lib/standalone-openshift2.xml /opt/eap/standalone/configuration

#  set jboss.server.base.dir
#  To run: sudo podman run -e SERVER_BASE_DIR=/opt/eap/custom-standalone eap74entry == doesn't work 
#  Reason: jboss.server.base.dir is a dir with dirs: configuration  deployments  lib  tmp
#    ENTRYPOINT /opt/eap/bin/standalone.sh -Djboss.server.base.dir=${SERVER_BASE_DIR}

#  set standalone config as standalone-openshift2.xml
#  To run: sudo podman run -e STANDALONE_CONFIG=standalone-openshift2.xml eap74entry

ENTRYPOINT /opt/eap/bin/standalone.sh -c ${STANDALONE_CONFIG}