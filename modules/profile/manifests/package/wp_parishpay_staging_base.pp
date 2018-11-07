#
# Word Press parishpay Stage Base/Theme
#

class profile::package::wp_parishpay_staging_base {
  package {'wp-parishpay_staging_base':
    ensure => hiera('profile::wordpress_stg::parishpay_base', 'present'),
  }

  package {'wp-parishpay_staging_theme':
    ensure => hiera('profile::wordpress_stg::parishpay_theme', 'present'),
  }
}
