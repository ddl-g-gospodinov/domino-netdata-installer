#!/bin/bash
curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --prepare-offline-install-source ./netdata-offline
tar cvfz ./netdata-offline.tar.gz ./netdata-offline/
rm -rf ./netdata-offline/
