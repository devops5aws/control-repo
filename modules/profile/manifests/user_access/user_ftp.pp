#
# User Access for ftp
#

class profile::user_access::user_ftp {

  $ftp_group = hiera('profile::ftp::group', 'ftp')


  case $ec2_tag_component {
    'qa_usw2': {

      user { 'qasftptester':
        ensure       => 'present',
        groups       => $ftp_group,
        managehome   => 'true',
        shell        => '/bin/bash',
        password     => hiera('profile::passwd::qasftptester'),
        before       => [
                          Package['vsftpd'],
                        ],
      }

      user { 'devsftptester':
        ensure       => 'present',
        groups       => $ftp_group,
        managehome   => 'true',
        shell        => '/bin/bash',
        password     => hiera('profile::passwd::devsftptester'),
        before       => [
                          Package['vsftpd'],
                        ],
      }
    }
    'st_usw2': {
    }
    'pd_usw2', 'pd_euw1': {
    }
  }
}
