# EAP 7.4.4 + Jgroups's UFC
FROM registry.redhat.io/jboss-eap-7/eap74-openjdk8-openshift-rhel7:7.4.4
COPY version.txt /opt/eap/version.txt
COPY lib/standalone-openshift.xml /opt/eap/standalone/configuration/
