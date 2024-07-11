# @api private
#
# @summary Ensure default user umask is 027 or more restrictive
#
class secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive {
  file { 'ensure_a_single_firewall_configuration_utility_is_in_use.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_default_user_umask_is_027_or_more_restrictive.sh'),
    before  => Exec['ensure_default_user_umask_is_027_or_more_restrictive.sh'],
  }
  exec { "Ensure default user umask is 027 or more restrictive":
    command   => "/usr/share/cis_scripts/ensure_default_user_umask_is_027_or_more_restrictive.sh",
    logoutput => true,
  }
}
