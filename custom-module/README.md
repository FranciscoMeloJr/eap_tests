Creating a custom module in EAP 7 via template

Basically by adding a folder named modules on the application sources --> All the files under the modules directory are copied to the EAP_HOME/modules/ directory in the JBoss EAP for the OpenShift image during the S2I build process. 

This is described on the S2I documentation: https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.4/html-single/getting_started_with_jboss_eap_for_openshift_container_platform/index#eap_s2i_process

