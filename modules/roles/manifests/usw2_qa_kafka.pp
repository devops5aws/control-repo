
# USW2 QA Kafka
#

class roles::usw2_qa_kafka {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::kafka_conf

  #package
  include profile::package::bigtop_utils
  include profile::package::jdk_1_8

  #yumrepo
  include profile::yum_tools_s3
}
