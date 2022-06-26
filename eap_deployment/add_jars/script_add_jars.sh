# deploy an application inside EAP pod manually adding there
# Required: pod's name
# oc get pod 
oc cp test_app/ServletExamples.war  $1:/opt/eap/standalone/deployments
# confirm the file is there:
oc exec -it $1 -- ls -lrt /opt/eap/standalone/deployments/

#-rw-r--r--. 1 jboss root       19 Jun 26 01:22 ServletExamples.war.deployed
#-rw-r--r--. 1 jboss root  2115841 Jun 26 01:22 ServletExamples.war

