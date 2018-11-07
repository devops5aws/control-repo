#
# Word Press storagerentpayment Stage Base/Theme
#

class profile::package::wp_storagerentpayment_staging_base {
  package {'wp-storagerentpayment_staging_base':
    ensure => hiera('profile::wordpress_stg::storagerentpayment_base', 'present'),
  }

  package {'wp-storagerentpayment_staging_theme':
    ensure => hiera('profile::wordpress_stg::storagerentpayment_theme', 'present'),
  }
}
