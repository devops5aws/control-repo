class profile::timezone {

    $tz = hiera('profile::timezone', undef) # for example, US/Pacific
   
    if $tz != undef
    {
        file {'/etc/localtime': 
          ensure => link, 
          target => "/usr/share/zoneinfo/${tz}"}  
    }
  	
}

