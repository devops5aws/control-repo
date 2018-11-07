#
# QA Key USW2 Server
#

class roles::usw2_qa_key {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::yapstone_env
  include profile::yap_java_env
  include profile::upstart_tomcat_key
  include profile::yap_key_files

  #package
  include profile::package::daemontools
  include profile::package::jdk_1_7
  include profile::package::yap_socketserver

  #yumrepo
  include profile::yum_yap_s3
  include profile::yum_tools_s3
}
