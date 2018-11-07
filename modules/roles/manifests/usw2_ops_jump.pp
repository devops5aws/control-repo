#
# OPS Server Configs
#

class roles::usw2_ops_jump {

  #basenode: systems
  include profile::yapstone_base
  include profile::user_access::user_ro_tmp
  include profile::user_access::user_ro_noc
  include profile::user_access::user_ro_dev
  include profile::user_access::user_ro_qa
  include profile::user_access::user_ro_finance
  include profile::user_access::user_ro_contractors
  include profile::user_access::user_ro_qa_contractors

  #basenode: package
  include profile::yum_tools_s3
}
