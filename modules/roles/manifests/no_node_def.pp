#
#  No Server Node in Puppet
#

class roles::no_node_def {

  #basenode: systems
  include profile::yapstone_default_motd
  include profile::user_access::user_devops
  include profile::user_access::user_rw_tmp
  include profile::puppet_client
  include profile::ntp_client

  # Check_mk Monitoring
  include profile::check_mk_agent

  #basenode: package
  include profile::yum_tools_s3
  include profile::yum_centos_s3
}
