#
# QA Euro Regression Web Server
#

class roles::usw2_qa_eurweb {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::yapstone_env
  include profile::yap_qa_lighttpd
  include profile::upstart_lighttpd
  include profile::add_server_host
  include profile::yap_hosts_file

  #package
  include profile::package::bind_utils
  include profile::package::rp_webapp_static
  include profile::package::yaprpmq_xinetd
  include profile::package::lighttpd
  include profile::package::yap_hrp_eu
  include profile::package::yap_hrp_uk
  include profile::package::yap_hrp_web

  #yumrepo
  include profile::yum_yap_s3
  include profile::yum_tools_s3
}
