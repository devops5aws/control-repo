#!/bin/bash

ncurl () { curl --show-error --fail --retry 3 --retry-delay 10 -m 45 -s "$@"; }
ec2_instance_id () { ncurl http://169.254.169.254/latest/meta-data/instance-id; }
ec2_avzone () { ncurl http://169.254.169.254/latest/meta-data/placement/availability-zone; }
ec2_region () { ec2_avzone | sed -e 's/[a-z]$//g'; }

ec2_tags () {
    /usr/bin/aws ec2 describe-tags --region "$(ec2_region)" \
                          --filter 'Name=resource-type,Values=instance' \
                          --filter "Name=resource-id,Values=$(ec2_instance_id)" \
                          --query 'Tags[].[Key,Value]' --output text \
                          | awk '{printf "ec2_tag_%s=%s\n",$1,$2 }' \
                          | tr A-Z a-z | tr ':' '_'
   mkdir -p /etc/facter/facts.d
}

ec2_tags
