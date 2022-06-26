oc project default
oc delete project eap-demo
oc new-project eap-demo
oc create -f ../../automation/1979710\ fdemelojtest-secret.yaml
oc secrets link default 1979710-fdemelojtest-pull-secret --for=pull
oc secrets link builder 1979710-fdemelojtest-pull-secret --for=pull
for resource in   eap73-openjdk11-amq-persistent-s2i.json   eap73-openjdk11-amq-s2i.json   eap73-openjdk11-basic-s2i.json   eap73-openjdk11-https-s2i.json   eap73-openjdk11-image-stream.json   eap73-openjdk11-sso-s2i.json   eap73-openjdk11-starter-s2i.json   eap73-openjdk11-third-party-db-s2i.json   eap73-openjdk11-tx-recovery-s2i.json; do   oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-7-openshift-image/eap73/templates/${resource}; done
oc get template
