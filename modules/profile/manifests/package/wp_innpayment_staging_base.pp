#
# Word Press Innpayment Stage Base/Theme
#

class profile::package::wp_innpayment_staging_base {
  package {'wp-innpayment_staging_base':
    ensure => hiera('profile::wordpress_stg::innpayment_base', 'present'),
  }

  package {'wp-innpayment_staging_theme':
    ensure => hiera('profile::wordpress_stg::innpayment_theme', 'present'),
  }
}
