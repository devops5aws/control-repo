#
# QA Home Away App Server
#

class roles::usw2_qa_haapp {

  #basenode: systems
  include profile::yapstone_base
  #postfix_client
  include profile::postfix_client

  #configs
  include profile::yapstone_env
  include profile::yap_java_env
  include profile::yap_catalina_base_env
  include profile::yapstone_db_user
  include profile::upstart_tomcat_app
  include profile::yap_app_key

  #package
  include profile::package::ha_conf
  include profile::package::ha_base
  include profile::package::rp_webapp_app
  include profile::package::jdk_1_7
  include profile::package::apache_tomcat
  include profile::package::daemontools
  include profile::package::yaprpmq_xinetd

  #yumrepo
  include profile::yum_yap_s3
  include profile::yum_tools_s3
}
