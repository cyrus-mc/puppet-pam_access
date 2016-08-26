# == Class: pam_access::config
#
# === Authors
#
# Matthew Ceroni <matthew.ceroni@smarhs.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class pam_access::config {

  # parent class must be defined
  if ! defined(Class[ '::pam_access' ]) {
    fail("${module_name} : You must declare class ${module_name} before ${module_name}::config")
  }

  # in order for /etc/security/access.conf to be enforced pam_access.so must be called
  file_line { "pam_access.so":
    ensure => 'present',
    path   => "${::pam_access::params::pam_config_path}/sshd",
    line   => 'account    required     pam_access.so',
    after  => 'account    required     pam_nologin.so',
  }

              $access_config_path = hiera('pam_access::access_config_path', '/etc/security/access.conf')

  # put out /etc/security/access.conf 
  concat { "${::pam_access::params::access_config_path}/access.conf":
    ensure => 'present'
  }

  concat::fragment { 'access-conf-base':
    target => "${::pam_access::params::access_config_path}/access.conf",
    source => "puppet:///modules/${module_name}/access.conf.base",
    order  => '00'
  }

}
