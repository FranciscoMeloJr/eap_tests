Deploying an applicatin via Image Source:
$ oc new-project eap-binary
$ oc import-image jboss-eap-7/eap73-openjdk11-openshift-rhel8 --from=registry.redhat.io/jboss-eap-7/eap73-openjdk11-openshift-rhel8 --confirm
$ mkdir tmp/
$ oc get is
$ oc new-app eap73-openjdk11-openshift-rhel8~tmp/ --name=servlet-examples
$ oc status
$ oc logs -f bc/servlet-examples
$ oc start-build servlet-examples --from-file=test_app/ServletExamples.war