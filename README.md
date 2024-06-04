<h1>Blue-Green Deployment for pet clinic java application server configrations and operations</h1>
<h2>Through Ansible Directory responsible for most of the server configrations and operations is done</h2>
<h3>Defined in the directory the installation and the configration of:</h3>
<li>Tomcat</li>
<li>Nagios</li>
<li>Jenkins</li>
<h3>Each component installation is done in a separate role and then executed all roles in the configration playbook (InstallationPlaybook.yaml). Specific configrations is conducted on tomcat to make it operatable on port 9090 and to set up admin credentials (ConfigTomcatPlaybook.yml). A replica from the tomcat instance is created to be used in the deployment (Green-InstanceConfig.yaml)</h3>
<h3>Defined in the inventory file the server that will be managed by ansible</h3>
<h2>nginx is installed and used as load balancer between the two enviroments for smooth deployment</h2>
<h3>Steps of nginx installation configrations of nginx through linux terminal:</h3>
<label>nginx dependencies installation</label>
<li>sudo apt install build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev</li>
<label>Download nginx:</label>
<li>wget http://nginx.org/download/nginx-1.24.0.tar.gz</li>
<label>Extract nginx tar file:</label>
<li>tar -zxvf nginx-1.24.0.tar.gz</li>
<label>Extract nginx tar file:</label>
<li>tar -zxvf nginx-1.24.0.tar.gz</li>
<label>change directory to extracted file:</label>
<li>cd nginx-1.24.0</li>
<label>Configure the build options:</label>
<li>./configure</li>
<label>Compile and install nginx:</label>
<li>sudo make install</li>
<label>start nginx:</label>
<li>sudo /opt/nginx/sbin/nginx</li>
<label>servers addition to nginx load balancer (nginx.conf modification):</label>
<ol><img src="nginx1.png"></ol>
<ol><img src="nginx2.png"></ol>
<label>restart nginx after applying modifications:</label>
<li>sudo /opt/nginx/sbin/nginx -s reload</li>
<h3>Build and Deployment is done through Jenkins pipeline</h3>
<h4>This pipeline is responsible for:</h4>
<li>Fetch for the updated git repository</li>
<li>Edit the pom.xml file in the java application to generate war file</li>
<li>Edit the main java class in the application to make it able to run on a server</li>
<li>Run the build command to build the application</li>
<li>Identify the server which traffic is directed to and start deployment to the idle one</li>
<li>Deploy the packed application to apache idle tomcat inctance</li>
<li>check the if the deployment runs smoothly then direct traffic to it</li>
<h3>Server monitoring is done through Nagios</h3>
<h4>The monitoring proccess is responsible for runinng sanity checks to monitor tomcat server which is done as follows :</h4>
<li>Define nagios service to monitor the two tomcat instances in tomcat.cfg</li>
<li>Execute playbook to save nagios service configrations and restart nagios (Monitor.yaml)</li>
