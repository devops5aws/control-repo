class postfix::packages {
  include ::postfix::params

  package { 'postfix':
    ensure => installed,
  }

}
