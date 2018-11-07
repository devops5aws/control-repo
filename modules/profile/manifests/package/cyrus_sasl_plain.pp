#
# RPM for cyrus-sasl-plain
#
class profile::package::cyrus_sasl_plain {
  package {'cyrus-sasl-plain':
    ensure => hiera('profile::package::cyrus_sasl_plain', 'present'),
    before  => [
                 Service['postfix'],
                 Service['saslauthd'],
                 Class['postfix'],
               ],
  }
}
