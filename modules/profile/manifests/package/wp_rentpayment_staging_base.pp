#
# Word Press Rentpayment Stage Base/Theme
#

class profile::package::wp_rentpayment_staging_base {
  package {'wp-rentpayment_staging_base':
    ensure => hiera('profile::wordpress_stg::rentpayment_base', 'present'),
  }

  package {'wp-rentpayment_staging_theme':
    ensure => hiera('profile::wordpress_stg::rentpayment_theme', 'present'),
  }
}
