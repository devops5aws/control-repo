#
# Samba Configuration for SFTP server
#
class profile::yap_samba {

  $export_name          =  hiera('profile::yap_samba::export_name')
  $export_comment       =  hiera('profile::yap_samba::export_comment')
  $export_path          =  hiera('profile::yap_samba::export_path')
  $export_public        =  hiera('profile::yap_samba::export_public', 'yes')
  $export_writable      =  hiera('profile::yap_samba::export_writable', 'yes')
  $export_printable     =  hiera('profile::yap_samba::export_printable', 'no')
  $export_guest_ok      =  hiera('profile::yap_samba::export_guest_ok', 'yes')
  $samba_username       =  hiera('profile::yap_samba::samba_username')
  $samba_home_dir       =  hiera('profile::yap_samba::samba_home_dir')

  class { '::samba::server':
    workgroup           => hiera('profile::yap_samba::workgroup'),
    server_string       => hiera('profile::yap_samba::server_string'),
    security            => hiera('profile::yap_samba::security'),
    guest_account       => hiera('profile::yap_samba::guest_account'),
    passdb_backend      => hiera('profile::yap_samba::passdb_backend'),

    shares  => {
      "$export_name"  => [ 
        "comment = $export_comment",
        "path = $export_path",
        "public = $export_public",
        "writable = $export_writable",
        "printable = $export_printable",
        "guest ok = $export_guest_ok",
      ],
    },
  }

  group { $samba_username:
    ensure  => present,
  }

  user { $samba_username:
    ensure       => present,
    comment      => 'User for samba',
    groups       => $samba_username,
    managehome   => true,
    home         => $samba_home_dir,
  }

  file { $samba_home_dir:
    ensure => directory,
    owner  => $samba_username,
    group  => $samba_username,
    mode   => 0755,
  }

  file { $export_path:
    ensure => directory,
    owner  => $samba_username,
    group  => $samba_username,
    mode   => 0755,
  }
}
