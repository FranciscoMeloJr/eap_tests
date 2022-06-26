# deploy an application insdie EAP image 

### Get pods:
oc get pods

### put the jars on the deployment dir
$ oc cp ServletExamples.war  $1:/opt/eap/standalone/deployments