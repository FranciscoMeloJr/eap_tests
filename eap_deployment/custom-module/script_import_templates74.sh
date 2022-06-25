oc project default
oc delete project eap-demo1
oc new-project eap-demo1
oc create -f ../../automation/1979710\ fdemelojtest-secret.yaml
oc secrets link default 1979710-fdemelojtest-pull-secret --for=pull
oc secrets link builder 1979710-fdemelojtest-pull-secret --for=pull

oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/eap74-openjdk11-image-stream.json

for resource in eap74-basic-s2i.json eap74-https-s2i.json; do oc replace --force -f https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/templates/${resource}; done

oc get template
