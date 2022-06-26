#!/bin/bash

# Title: test application ServletExamples
# Summary: Script to test an application deployed in EAP - given the route
# Parameter Required: none

application="ServletExamples/"
# oc get routes <--- get the route and then put here:
# http://servlet-examples-eap-binary.apps.com/ServletExamples/
routes=$(oc get routes --no-headers | awk '{print $2}')
curl http://$routes/$application/

### EXPECTED OUTPUT:

#<!DOCTYPE html>
#<html>
#<head>
#<meta charset="UTF-8">
#<title>Java Melody App</title>
#</head>
#<body>
# <h2> Testing Java Melody in JBoss EAP </h2>
#</body>
#</html>