# domino-netdata-installer
This Ansible play will deploy NetData and configure nginx proxy pass for each of the hosts. As such avoiding the 
need for direct access to the hosts we wish to monitor. 

The play will use your defined hosts inventory to setup the backend proxy pass to each netdata agent dashbaoard 
and will also generate a simple index.html with links to all hosts. 

The FQDN for each host will be used to setup the URL to the agent. 
Example: 
http://<your_nginx_server>/netdata/<fqdn_of_the_host_to_monitor>/

Note: the play is using  {{ ansible_default_ipv4.address }} for the nginx vhost server_name . 

To install the monitoring agent you will require access to the internet. 
For offline isntallation on completely air gapped systems you will need to use 
the offline_installer files . 
