oc project default
oc delete project eap-galleon
oc new-project eap-galleon --display-name 'EAP Test with JDBC'
#oc new-app registry.redhat.io/jboss-eap-7/eap74-openjdk8-openshift-rhel7:7.4.4-2 -p IMAGE_STREAM_NAMESPACE=eap-galleon -p SOURCE_REPOSITORY_URL=https://github.com/jboss-developer/jboss-eap-quickstarts -p SOURCE_REPOSITORY_REF=7.3.x-openshift -p GALLEON_PROVISION_LAYERS=jaxrs-server,jpa,datasources-web-server -p CONTEXT_DIR=helloworld-html56 --build-env GALLEON_PROVISION_FEATURE_PACKS="org.jboss.eap:eap-datasources-galleon-pack:7.4.0.GA-redhat-00003"
oc create -f ../automation/1979710\ fdemelojtest-secret.yaml
oc secrets link default 1979710-fdemelojtest-pull-secret --for=pull
oc secrets link builder 1979710-fdemelojtest-pull-secret --for=pull

oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/eap74-openjdk11-image-stream.json
for resource in eap74-basic-s2i.json eap74-https-s2i.json; do oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/templates/${resource}; done
oc get template

### From the template eap73-openjdk11-starter-s2i add the 
oc new-app --template=eap74-basic-s2i -p IMAGE_STREAM_NAMESPACE=eap-galleon -p EAP_IMAGE_NAME=jboss-eap74-openjdk11-openshift:7.4.0 \
 -p EAP_RUNTIME_IMAGE_NAME=jboss-eap74-openjdk11-runtime-openshift:7.4.0 \
 -p SOURCE_REPOSITORY_URL=https://github.com/jboss-developer/jboss-eap-quickstarts \
 -p SOURCE_REPOSITORY_REF=7.4.x \
 -p GALLEON_PROVISION_LAYERS=jaxrs-server,postgresql-driver,web-clustering \
 -p CONTEXT_DIR=helloworld-html5