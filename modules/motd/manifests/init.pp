class motd {  
  file { "/usr/share/base-files/motd":
        owner => "root",
        group => "root",
        mode  => "0755",
	source => "puppet:///modules/motd/motd"

  }
}
