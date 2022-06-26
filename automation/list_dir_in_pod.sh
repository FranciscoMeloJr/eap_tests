echo "Scrip to list jars inside EAP image's ironjacamar given a pod name"
echo "ironjacamar main directory::::::::::::::"
oc exec -it $1 -- ls -lrt /opt/eap/modules/system/layers/base/org/jboss/ironjacamar/
echo "ironjacamar/jdbcadapters directory::::::::::::::"
oc exec -it $1 -- ls -lrt /opt/eap/modules/system/layers/base/org/jboss/ironjacamar/jdbcadapters
oc exec -it $1 -- ls -lrt /opt/eap/modules/system/layers/base/org/jboss/ironjacamar/jdbcadapters/main

echo "ironjacamar/impl main directory::::::::::::::"
oc exec -it $1 -- ls -lrt /opt/eap/modules/system/layers/base/org/jboss/ironjacamar/impl/main

echo "ironjacamar/api main directory::::::::::::::"
oc exec -it $1 -- ls -lrt /opt/eap/modules/system/layers/base/org/jboss/ironjacamar/api/main

echo "show content in" $2 " directory::::::::::::::"
oc exec -it $1 -- ls -lrt $2