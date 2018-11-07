#
# RPM for cyrus-sasl-sql
#
class profile::package::cyrus_sasl_sql {
  package {'cyrus-sasl-sql':
    ensure  => hiera('profile::package::cyrus_sasl_sql', 'present'),
    before  => [
                 Service['postfix'],
                 Service['saslauthd'],
                 Class['postfix'],
               ],
  }
}
