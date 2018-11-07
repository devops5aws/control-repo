#
# QA Euro FARMS Server
#

class roles::usw2_qa_eurfarms {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::yapstone_env
  include profile::yap_java_env
  include profile::yap_catalina_base_env
  include profile::upstart_tomcat_farms
  include profile::yap_farms_key

  #package
  include profile::package::farms_base
  include profile::package::farmsgd1_conf
  include profile::package::farms_webapp_app
  include profile::package::apache_tomcat
  include profile::package::daemontools
  include profile::package::jdk_1_8
  include profile::package::yaprpmq_xinetd

  #yumrepo
  include profile::yum_yap_s3
  include profile::yum_tools_s3
}
