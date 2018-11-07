#
# VSFTPD for Servers
#
class profile::vsftpd {

  class { '::vsftpd':
    template   => 'vsftpd/empty.conf.erb',
    directives => {
                    anonymous_enable        => hiera('profile::vsftp::anonymous_enable', 'NO'),
                    local_enable            => hiera('profile::vsftp::local_enable', 'YES'),
                    write_enable            => hiera('profile::vsftp::write_enable', 'YES'),
                    local_umask             => hiera('profile::vsftp::local_umask', '022'),
                    dirmessage_enable       => hiera('profile::vsftp::dirmessage_enable', 'YES'),
                    xferlog_enable          => hiera('profile::vsftp::xferlog_enable', 'YES'),
                    connect_from_port_20    => hiera('profile::vsftp::connect_from_port_20', 'YES'),
                    xferlog_std_format      => hiera('profile::vsftp::xferlog_std_format', 'YES'),
                    data_connection_timeout => hiera('profile::vsftp::data_connection_timeout', '180'),
                    nopriv_user             => hiera('profile::vsftp::nopriv_user', 'ftp'),
                    ftpd_banner             => hiera('profile::vsftp::ftpd_banner', 'Welcome to the YapStone, Inc. FTP server'),
                    ls_recurse_enable       => hiera('profile::vsftp::ls_recurse_enable', 'YES'),
                    listen                  => hiera('profile::vsftp::listen', 'YES'),
                    pam_service_name        => hiera('profile::vsftp::pam_service_name', 'vsftpd'),
                    userlist_enable         => hiera('profile::vsftp::userlist_enable', 'YES'),
                    tcp_wrappers            => hiera('profile::vsftp::tcp_wrappers', 'YES'),
                    secure_chroot_dir       => hiera('profile::vsftp::secure_chroot_dir', '/var/ftp'),
                    log_ftp_protocol        => hiera('profile::vsftp::log_ftp_protocol', 'YES'),
                    syslog_enable           => hiera('profile::vsftp::syslog_enable', 'YES'),
                    ssl_enable              => hiera('profile::vsftp::ssl_enable', 'YES'),
                    allow_anon_ssl          => hiera('profile::vsftp::allow_anon_ssl', 'NO'),
                    force_local_data_ssl    => hiera('profile::vsftp::force_local_data_ssl', 'NO'),
                    force_local_logins_ssl  => hiera('profile::vsftp::force_local_logins_ssl', 'NO'),
                    ssl_tlsv1               => hiera('profile::vsftp::ssl_tlsv1', 'YES'),
                    ssl_sslv2               => hiera('profile::vsftp::ssl_sslv2', 'NO'),
                    ssl_sslv3               => hiera('profile::vsftp::ssl_sslv3', 'NO'),
                    rsa_cert_file           => hiera('profile::vsftp::rsa_cert_file', '/etc/vsftpd/vsftpd.pem'),
                  }
  }

  file { '/etc/vsftpd/':
    ensure   => 'directory',
    owner    => 'root',
    group    => 'root',
    mode     => 0755,
    before   => [
                  Package['vsftpd'],
                  Class['::vsftpd'],
                ],
  }

  file { '/etc/vsftpd/vsftpd.pem':
    ensure    => 'present',
    owner     => 'root',
    group     => 'root',
    mode      => 0600,
    content   => template('profile/vsftpd.pem.erb'),
    require   => File['/etc/vsftpd'],
    before   => [
                  Package['vsftpd'],
                  Class['::vsftpd'],
                ],
  }

  file { '/etc/vsftpd/user_list':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => 0644,
    content   => template('profile/user_list.erb'),
    require   => File['/etc/vsftpd'],
    before   => [
                  Package['vsftpd'],
                  Class['::vsftpd'],
                ],
  }

  file { '/etc/vsftpd/ftpusers':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => 0644,
    content   => template('profile/ftpusers.erb'),
    require   => File['/etc/vsftpd'],
    before   => [
                  Package['vsftpd'],
                  Class['::vsftpd'],
                ],
  }
}
