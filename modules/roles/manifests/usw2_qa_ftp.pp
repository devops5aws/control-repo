#
# QA FTP Server
#

class roles::usw2_qa_ftp {

  #basenode: systems
  include profile::yapstone_base

  #configs
  include profile::user_access::user_ftp
  include profile::vsftpd

  #yumrepo
  include profile::yum_yap_s3
  include profile::yum_tools_s3
}
