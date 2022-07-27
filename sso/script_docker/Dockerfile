# EAP 7.4.4 with sso properties
FROM registry.redhat.io/jboss-eap-7/eap74-openjdk8-openshift-rhel7:7.4.4
COPY version.txt /opt/eap/version.txt
RUN mkdir /opt/eap/extensions
COPY lib/actions.cli /opt/eap/extensions
COPY lib/postconfigure.sh /opt/eap/extensions

USER root
RUN chmod 774 /opt/eap/extensions/*.sh
USER jboss

CMD ["/opt/eap/bin/openshift-launch.sh"]