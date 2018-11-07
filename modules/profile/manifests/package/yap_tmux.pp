#
# Package Custome Compile Tmux
#
class profile::package::yap_tmux {
  package {'yap-tmux':
    ensure => hiera('profile::package::yap_tmux_ver', 'present'),
    require => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
