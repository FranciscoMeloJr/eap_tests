# script to print only the pod names:
oc get pods -o custom-columns=POD:.metadata.name --no-headers

# script to get only route:
oc get routes --no-headers | awk '{print $2}'
