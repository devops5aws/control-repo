#!/bin/bash

if [ ! -f /etc/facter/facts.d/ec2_app_hostname.txt ] ; then
  echo $HOSTNAME |sed 's/web/app/g' | awk '{ print "ec2_tag_app_hostname="$1}' > /etc/facter/facts.d/ec2_app_hostname.txt
fi
