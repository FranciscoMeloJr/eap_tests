oc delete cm jboss-cli
oc create configmap jboss-cli --from-file=postconfigure.sh=postconfigure.sh --from-file=actions.cli=actions.cli
oc set volume dc/eap-app --add --name=jboss-cli -m /opt/eap/extensions -t configmap --configmap-name=jboss-cli --default-mode='0777' --overwrite
## 
oc get cm | grep jboss-cli
## get pod:
podname=$(oc get pods | grep 'Running' | awk 'NR==1 {print $1}')

## delete pod
oc delete pod $podname
sleep 30s
## get pod
podname=$(oc get pods | grep 'Running' | awk 'NR==1 {print $1}')
## get configuration
oc exec -it $podname -- cat /opt/eap/standalone/configuration/standalone-openshift.xml