Given you are loged in OCP, do an EAP deployment (i.e. add an application in the EAP image):

Id  | Usage | dir
--------- | --------- | ---------  
1 | Use one of the JBoss EAP templates | template
2 | Use a binary build, the WAR artifact, and the official JBoss EAP container image | binary
3 | Add the jar directly to the pod (yes you can do that, but yes it will be ephemeral) | add_jars
4 | Use a dockerfile to add the application directly there | dockerfile

The directory default is the default image no application deployed;

These are the four possible solutions for this problem, there is actually only three feasible solutions in reality because adding the jars directly is not a real solution and if the pod crashes (which is not uncommon) so the jars disapear.

