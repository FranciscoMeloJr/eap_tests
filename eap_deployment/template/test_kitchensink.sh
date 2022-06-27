# oc get routes <--- get the route and then put here:
# http://servlet-examples-eap-binary.apps.com/ServletExamples/
routes=$(oc get routes --no-headers | awk '{print $2}')
curl http://$routes

podname=$(oc get pods --no-headers | awk 'NR==1 {print $1}')
oc exec -it $podname -- ls -lrt /opt/eap/standalone/deployments