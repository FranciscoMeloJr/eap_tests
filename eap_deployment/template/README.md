Using a template deployment with source to image, which is using the template to build the EAP image

~~~
$ oc get pods -w
NAME                              READY     STATUS      RESTARTS   AGE
eap-app-1-8vkcs                   1/1       Running     0          1m
eap-app-1-deploy                  0/1       Completed   0          1m
eap-app-2-build                   0/1       Completed   0          2m
eap-app-build-artifacts-1-build   0/1       Completed   0          5m
~~~