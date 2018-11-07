#
# Word Press duespayment Stage Base/Theme
#

class profile::package::wp_duespayment_staging_base {
  package {'wp-duespayment_staging_base':
    ensure => hiera('profile::wordpress_stg::duespayment_base', 'present'),
  }

  package {'wp-duespayment_staging_theme':
    ensure => hiera('profile::wordpress_stg::duespayment_theme', 'present'),
  }
}
