# == Class: pam_access
#
# === Authors
#
# Matthew Ceroni <matthew.ceroni@smarhs.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class pam_access (
    $rules = undef
  ) inherits pam_access::params {

  include ::pam_access::config

}
