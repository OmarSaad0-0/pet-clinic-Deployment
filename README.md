<h1>Ansible Directory responsible for server configrations and operations</h1>
<h3>defined the installation and the configration of:</h3>
<li>Tomcat</li>
<li>Nagios</li>
<li>Jenkins</li>
<h3>Each component installation is done in a separate role and then executed all roles in the configration playbook (InstallationPlaybook.yaml). Specific configrations is conducted on tomcat to make it operatable on port 9090 and to set up admin credentials (ConfigTomcatPlaybook.yml)</h3>
<h3>Defined in the inventory file the server that will be managed by ansible</h3>
<h3>Build and Deployment is done through Jenkins pipeline</h3>
<h4>This pipeline is responsible for:</h4>
<li>Fetch for the updated git repository</li>
<li>Edit the pom.xml file in the java application to generate war file</li>
<li>Edit the main java class in the application to make it able to run on a server</li>
<li>Run the build command to build the application</li>
<li>Deploy the packed application to apache tomcat server</li>
