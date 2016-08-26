# == define: pam_access::rule
#
# === Authors
#
# Matthew Ceroni <matthew.ceroni@smarhs.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
define pam_access::rule (
  $permission,
  $users,
  $origins,
  $order
  ) {

  # deploy fragment
  concat::fragment { "access-conf-${title}":
    target  => "${::pam_access::params::access_config_path}/access.conf",
    content => template("${module_name}/rule.erb"),
    order   => "$order"
  }
}
