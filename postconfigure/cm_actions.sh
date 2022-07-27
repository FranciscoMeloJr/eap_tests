## Script to create a cm with two files:
echo "Create cm from " $1 " and " $2
cmname=jboss-cli
location=/opt/eap/extensions

## Delete previous 
oc delete cm $cmname

## Create a config map with the content (actions.cli) that we need to include in the postconfigure.sh:
oc create configmap $cmname --from-file=$1 --from-file=$2

## Get the deployment name:
dcname=$(oc get dc | awk 'NR==2 {print $1}')
echo dcname

## Mount the config map into the pods via the deployment controller or deployment:
oc set volume dc/$dcname --add --name=$cmname -m $location -t configmap --configmap-name=$cmname --default-mode='0777' --overwrite

## Confirm creation of cm:
oc get cm | grep $cmname

## delete pod:
echo "delete pods"
echo "get pod logs"

# to see if the cm file are there:
#$ oc exec -it $podname -- ls /opt/eap/extensions

# to see if the changes entered in effect:
#$ oc exec -it eap-app-2-69s4x -- cat /opt/eap/standalone/configuration/standalone-openshift.xml | grep "infinispan"


## Search for::
#~~~
#INFO Configuring the server with custom extensions script /tmp/cli-reload-configuration-script-1656649633.cli
#04:27:12,281 INFO  [org.jboss.as.controller] (Controller Boot Thread) WFLYCTL0468: Completed running the commands from the CLI script
#File /opt/eap/extensions/actions_local.cli doesn't exist.
#~~~


#VS

#~~~
#04:32:58,527 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: JBoss EAP 7.4.5.GA (WildFly Core 15.0.13.Final-redhat-00001) started in 1906ms - Started 57 of 85 services (35 services are lazy, passive or on-demand)
#The batch executed successfully
#~~~

#$ oc logs eap-app-2-6k8zx | grep "The batch executed successfully"
#The batch executed successfully

###  default:
#oc create configmap jboss-cli --from-file=postconfigure.sh=postconfigure.sh --from-file=actions.cli=actions.cli
#configmap/jboss-cli created
# oc set volume dc/eap-app --add --name=jboss-cli -m /opt/eap/extensions -t configmap --configmap-name=jboss-cli --default-mode='0777' --overwrite
