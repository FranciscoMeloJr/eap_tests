oc delete cm jboss-cli
oc create configmap jboss-cli --from-file=postconfigure.sh=postconfigure.sh --from-file=actions.cli=actions.cli
oc set volume dc/eap-app --add --name=jboss-cli -m /opt/eap/extensions -t configmap --configmap-name=jboss-cli --default-mode='0777' --overwrite
## delete pod
oc delete pod $podname
## get pod
oc get pod
## get configuration
oc exec -it $podname -- cat /opt/eap/standalone/configuration/standalone-openshift.xml