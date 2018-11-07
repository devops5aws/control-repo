#
# Yapstone Default Install for all Systems
#
class profile::yapstone_base {

  case "$ec2_tag_product-$ec2_tag_component" {
    /^(eu|eur|ip|ipr|ha|har|rp|rpr|ca|car)_app-qa_usw2/: {
      include profile::tmux_conf
      include profile::package::yap_tmux
      include profile::yap_newrelic
    }
    /^(eu|eur|ip|ipr|ha|har|rp|rpr|ca|car)_app-(dm|pd|wh|st)_(euw1|usw2)/,
    /notification-(pd|st)_(euw1|usw2)/,
    /farms-(qa|dm|pd|wh|st)_(euw1|usw2)/,
    'rinfra-qa_usw2',
    'infra-qa_usw2': {
      include profile::yap_newrelic
    }
  }

  case $ec2_tag_component {
    'qa_usw2': {
      include profile::user_access::user_rw_qa
      include profile::user_access::user_rw_dev
      include profile::user_access::user_rw_tmp
      include profile::user_access::user_dev_deploy
      include profile::user_access::user_rw_qa_contractors
    }
    'dv_usw2': {
     include profile::user_access::user_rw_qa
     include profile::user_access::user_rw_dev
     include profile::user_access::user_rw_tmp
     include profile::user_access::user_dev_deploy
     include profile::user_access::user_rw_contractors
     }
    'dm_usw2', 'st_usw2', 'st_euw1', 'wh_usw2': {
      include profile::user_access::user_ro_qa
      include profile::user_access::user_ro_dev
      include profile::user_access::user_ro_noc
      include profile::user_access::user_ro_tmp
      # Splunk
      include profile::package::splunkforwarder
      include profile::splunk_forwarder_client
    }
    'pd_euw1', 'op_euw1', 'pd_usw2', 'op_usw2': {
      include profile::package::splunkforwarder
      include profile::splunk_forwarder_client
    }
  }
  
  case $domain {
    'euw1.yapstone.com', 'usw2.yapstone.com': {
      #TripWire Config
      include profile::tripwire_agent
      #TripWire Packages
      include profile::package::axon_agent
      include profile::package::tw_eg_driver_rhel
      include profile::package::tw_eg_service
    }
  }

  #default configs
  include profile::yapstone_motd
  include profile::puppet_client
  include profile::facter_update
  include profile::timezone
  include profile::ntp_client
  include profile::cron_puppet_agent
  #Security Audit
  include profile::yap_user_audit

  #user access
  include profile::user_access::user_devops
  include profile::user_access::user_deploy
  include profile::user_access::user_rw_qualys

  #Packages
  include profile::package::nc

  #basenode: monitoring
  include profile::check_mk_agent
  include profile::package::newrelic_sysmond
  include profile::package::yap_newrelic

  #Yum Repo
  include profile::yum_centos_s3
}
