#
# USW2 QA Zookeeper
#

class roles::usw2_qa_zk {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::zookeeper_conf

  #package
  include profile::package::bigtop_utils
  include profile::package::zookeeper
  include profile::package::zookeeper_server
  include profile::package::jdk_1_8

  #yumrepo
  include profile::yum_tools_s3
}
