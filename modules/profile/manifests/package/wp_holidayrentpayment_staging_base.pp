#
# Word Press holidayrentpayment Stage Base/Theme
#

class profile::package::wp_holidayrentpayment_staging_base {
  package {'wp-holidayrentpayment_staging_base':
    ensure  => hiera('profile::wordpress_stg::holidayrentpayment_base', 'present'),
  }

  package {'wp-holidayrentpayment_staging_theme':
    ensure => hiera('profile::wordpress_stg::holidayrentpayment_theme', 'present'),
  }
}
