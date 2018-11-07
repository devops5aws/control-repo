#
# QA Proxy Domestic Server Configs
#

class roles::usw2_qa_proxy {

  #basenode: systems
  include profile::yapstone_base

  #proxy
  include profile::yap_squid

  #package
  include profile::package::squid

  #yumrepo
  include profile::yum_yap_s3
  include profile::yum_tools_s3
}
