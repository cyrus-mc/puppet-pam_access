# == Class: pam_access::params
#
# === Authors
#
# Matthew Ceroni <matthew.ceroni@smarhs.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class pam_access::params {

  # OS specific default parameters
  case $::osfamily {
    'RedHat': {
      $pam_config_path    = hiera('pam_access::pam_config_path', '/etc/pam.d')
      $access_config_path = hiera('pam_access::access_config_path', '/etc/security')
    }

    default: {
      fail("${module_name} : unsupported OS family ${::osfamily}")
    }
  }

}
