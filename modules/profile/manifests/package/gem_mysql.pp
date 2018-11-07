#
# Profile for installing the mysql gem
#

class profile::package::gem_mysql {
  package { 'mysql':
    ensure   => latest,
    require  => Package[ 'gcc', 'ruby-devel' ], 
    provider => gem,
  }
}
