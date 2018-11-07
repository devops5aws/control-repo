#
# Word Press Vacationrentpayment Stage Base/Theme
#

class profile::package::wp_vacationrentpayment_staging_base {
  package {'wp-vacationrentpayment_staging_base':
    ensure => hiera('profile::wordpress_stg::vacationrentpayment_base', 'present'),
  }

  package {'wp-vacationrentpayment_staging_theme':
    ensure => hiera('profile::wordpress_stg::vacationrentpayment_theme', 'present'),
  }
}
