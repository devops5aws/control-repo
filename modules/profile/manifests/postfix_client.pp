class profile::postfix_client {

  class {'postfix':
    smtp_listen                            => hiera('profile::postfix::smtp_listen', '127.0.0.1'),
    inet_interfaces                        => hiera('profile::postfix::inet_interfaces', 'all'),
    relayhost                              => hiera('profile::postfix::relayhost'), #no default!
    myorigin                               => hiera('profile::postfix::myorigin', '$myhostname'),
    mynetworks                             => hiera('profile::postfix::mynetworks', '127.0.0.1'),
    mta                                    => true,
  }

  case "$ec2_tag_product-$ec2_tag_component" {
    /^eu_app-pd_euw1/: {
      postfix::hash { '/etc/postfix/sasl_passwd':
        ensure  => 'present',
        content => hiera('profile::postfix::sasl_passwd'),
      }

      postfix::config {
        'mydomain':                          value   => hiera('profile::postfix::mydomain');
        'smtp_sasl_auth_enable':             value   => hiera('profile::postfix::smtp_sasl_auth_enable', 'yes');
        'smtp_sasl_security_options':        value   => hiera('profile::postfix::smtp_sasl_security_options', 'noanonymous');
        'smtp_sasl_password_maps':           value   => hiera('profile::postfix::smtp_sasl_password_maps', 'hash:/etc/postfix/sasl_passwd');
        'smtp_use_tls':                      value   => hiera('profile::postfix::smtp_use_tls', 'yes');
        'smtp_tls_security_level':           value   => hiera('profile::postfix::smtp_tls_security_level', 'encrypt');
        'smtp_tls_note_starttls_offer':      value   => hiera('profile::postfix::smtp_tls_note_starttls_offer', 'yes');
        'smtp_tls_CAfile':                   value   => hiera('profile::postfix::smtp_tls_CAfile', '/etc/ssl/certs/ca-bundle.crt');
      }

      # Service needs to start to authenticate AWS SES Relay
      service { 'saslauthd':
        ensure    => running,
        enable    => true,
        hasstatus => false,
        before    => Service['postfix'],
        require   => [
                       Package['cyrus-sasl-sql'],
                       Package['cyrus-sasl-plain'],
                     ],
        start     => '/etc/init.d/saslauthd start',
        restart   => '/etc/init.d/saslauthd restart',
        status    => '/etc/init.d/saslauthd status',
      }

      file { '/etc/postfix/access':
        notify  => Service['saslauthd'],
         mode    => '0644',
         owner   => 'root',
         group   => 'root',
      }
    }
  }
}
