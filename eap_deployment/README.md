Given you are loged in OCP, do an EAP deployment (i.e. add an application in the EAP image):
1. Use one of the JBoss EAP templates.
2. Use a binary build, the WAR artifact, and the official JBoss EAP container image.
3. Add the jar directly to the pod (yes you can do that, but yes it will be ephemeral)
4. Use a dockerfile to add the application directly there
