### domino-netdata-installer

This Ansible play will deploy NetData and configure nginx proxy pass for each of the hosts. 
As such avoiding the need for direct access to the hosts we wish to monitor. 

The play will use your defined hosts inventory to setup the backend proxy pass configuration for nginx 
to each netdata agent dashbaoard and will also generate a simple index.html with links to all hosts it
installs the agent on. 

Ansible facts used to setup the nginx configuration and the index.html file: 

- **{{ ansible_fqdn }}** Is used to name each host in the index.html and also name the proxy pass backend in nginx
- **{{ ansible_default_ipv4.address }}**  is used for the proxy pass backend address.

Once the play is complete you can access the monitoring dashboard for each host as shown: 

Example: 
http://<your_nginx_server>/netdata/<fqdn_of_the_host_to_monitor>/

Note: the play is also using **{{ ansible_default_ipv4.address }}** for the nginx vhost server_name . 

### Deploying on air gapped enfironments

For an "offline" deployment with no direct access to the internet you can use the provided 
offline_installer files. 

First you will need to run **prep_offline_bundle.sh** on a host with internet access. This script will 
pull the required files for isntalling the monitoring agent and will then archive them creating 
**netdata-offline.tar.gz** , which is later used in the install play. 

```
# cd ./offline_installer/
# chmod +x prep_offline_bundle.sh ; ./prep_offline_bundle.sh
```

Once this is complete then you will have to move the entire **offline_installer** directory 
to your ansible control node and execute the play. 

```
# ansible-playbook ./install_netdata.yml
```

### Uninstalling the monitoring agent 

In each installer there is a play called **uninstall_netdata.yml** . This will stop and remove the agent from all hosts. 
The play uses the default location for the uninstall script (/opt/netdata/usr/libexec/netdata/netdata-uninstaller.sh) . 
You will have to modify this in case you have set a custom install location. 


