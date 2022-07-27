### Example with postconfigure

Use a config map to put two scripts: postconfigure.sh, which calls actions.cli in the mounte volume: /opt/eap/extensions <--- created

Script | Purpose
--------- | ---------
actions.cli | actions to be executed on this case create a cache example
actions_local.cli | actions to be executed
cm_actions.sh | to create the cm: ./cm_actions.sh postconfigure.sh actions_local.cli <--- postconfigure.sh is the only that works
postconfigure2.sh | does not work
postconfigure.sh | will call actions.cli or actions_local.cli
standalone-openshift.xml | output

postconfigure.sh actions_local.cli <--- postconfigure.sh is the only that works, for clear reasons.