#
# Word Press Yapstone Stage Base/Theme
#

class profile::package::wp_yapstone_staging_base {
  package {'wp-yapstone_staging_base':
    ensure => hiera('profile::wordpress_stg::yapstone_base', 'present'),
  }

  package {'wp-yapstone_staging_theme':
    ensure => hiera('profile::wordpress_stg::yapstone_theme', 'present'),
  }
}
