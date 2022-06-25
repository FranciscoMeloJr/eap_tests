oc new-project eap-demo
oc create -f ../automation/1979710\ fdemelojtest-secret.yaml
oc secrets link default 1979710-fdemelojtest-pull-secret --for=pull
oc secrets link builder 1979710-fdemelojtest-pull-secret --for=pull
#for resource in eap74-openjdk11-amq-persistent-s2i.json   eap73-openjdk11-amq-s2i.json   eap73-openjdk11-basic-s2i.json   eap73-openjdk11-https-s2i.json   eap73-openjdk11-image-stream.json   eap73-openjdk11-sso-s2i.json   eap73-openjdk11-starter-s2i.json   eap73-openjdk11-third-party-db-s2i.json   eap73-openjdk11-tx-recovery-s2i.json; do   oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-7-openshift-image/eap73/templates/${resource}; done
for resource in eap74-amq-persistent-s2i.json eap74-amq-s2i.json eap74-basic-s2i.json eap74-https-s2i.json eap74-sso-s2i.json; do oc replace -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/templates/${resource}; done

oc get template
#oc new-app --template=eap73-openjdk11-basic-s2i -p IMAGE_STREAM_NAMESPACE=eap-demo -p SOURCE_REPOSITORY_URL=https://github.com/jboss-developer/jboss-eap-quickstarts -p SOURCE_REPOSITORY_REF=7.3.x-openshift -p CONTEXT_DIR=kitchensink
oc new-app --template=eap73-openjdk11-basic-s2i -p IMAGE_STREAM_NAMESPACE=eap-demo1 -p EAP_IMAGE_NAME=jboss-eap73-openjdk11-openshift:7.3.0 -p EAP_RUNTIME_IMAGE_NAME=jboss-eap74-openjdk11-runtime-openshift:7.4.0 -p SOURCE_REPOSITORY_URL=https://github.com/goldmann/openshift-eap-examples -p SOURCE_REPOSITORY_REF=master -p CONTEXT_DIR=custom-module
#oc delete project eap-demo
#oc project default

## For seeing the logs:
oc logs -f bc/eap-app-build-artifacts