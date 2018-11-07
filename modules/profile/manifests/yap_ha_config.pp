#
#
#
class profile::yap_ha_config {

  $rp_root_dir       = hiera('profile::yap_ha_config::rp_root_dir', '/home/webapps/rentpayment/conf/rentpayment_root.properties')
  $vault_appid       = hiera('profile::yap_ha_config::vault_appid', '39B6728D-034D-42EC-B7B3-3B484FB066D7')
  $vault_clientid    = hiera('profile::yap_ha_config::vault_clientid', '')
  $vault_url         = hiera('profile::yap_ha_config::vault_url', 'http://vault-001.oak.yapstone.com:8200')

  file_line { "$vault_appid  $rp_root_dir":
    path      => "$rp_root_dir",
    line      => "vault_appId=$vault_appid",
    match     => "39B6728D-034D-42EC-B7B3-3B484FB066D7",
  }

  file_line { "$vault_clientid  $rp_root_dir":
    path      => "$rp_root_dir",
    line      => "vault_clientId=$vault_clientid",
    match     => '__PUPPET_VAULT_V2_CLIENT_ID__',
  }

  file_line { "$vault_url  $rp_root_dir":
    path      => "$rp_root_dir",
    line      => "vault_url=$vault_url",
    match     => '__PUPPET_VAULT_URL__',
  }
}
