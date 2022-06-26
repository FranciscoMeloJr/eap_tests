# deploy an application insdie EAP image 
oc new-project eap-demo --display-name 'EAP Test with Servlet App'
oc new-app registry.redhat.io/jboss-eap-7/eap74-openjdk8-openshift-rhel7:7.4.4-2

### Expose:
oc expose svc/eap74-openjdk8-openshift-rhel7
### Get pods:
oc get pods

## return the pod name:
podname=$(oc get po --no-headers | awk 'NR==1 {print $1}')

### put the jars on the deployment dir
oc cp test_app/ServletExamples.war $podname:/opt/eap/standalone/deployments

# confirm the file is there:
oc exec -it $podname -- ls -lrt /opt/eap/standalone/deployments/