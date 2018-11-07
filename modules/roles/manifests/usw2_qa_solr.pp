#
# USW2 QA Solr
#

class roles::usw2_qa_solr {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::yap_solr

  #package
  include profile::package::apache_solr
  include profile::package::jdk_1_8
  
  #yumrepo
  include profile::yum_tools_s3
}
