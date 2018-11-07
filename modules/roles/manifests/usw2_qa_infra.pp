#
# USW2 QA INfra Zookeeper / Kafka
#

class roles::usw2_qa_infra {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::user_access::user_samza
  include profile::zookeeper_conf
  include profile::kafka_conf
  include profile::yap_samza
  include profile::upstart_samza

  #package
  include profile::package::zookeeper
  include profile::package::zookeeper_server
  include profile::package::bigtop_utils
  include profile::package::jdk_1_8
  include profile::package::yap_notifications_server
  include profile::package::yap_pip27
  include profile::package::yap_python27

  #yumrepo
  include profile::yum_tools_s3
}
