# @api private
#
# @summary Ensure a single firewall configuration utility is in use
#
class secure_linux_cis::rules::ensure_a_single_firewall_configuration_utility_is_in_use {
  file { '/usr/share/cis_scripts/ensure_a_single_firewall_configuration_utility_is_in_use.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_a_single_firewall_configuration_utility_is_in_use.sh'),
    before  => Exec['Ensure a single firewall configuration utility is in use'],
  }
 
  exec { "Ensure a single firewall configuration utility is in use":
    command   => "/usr/share/cis_scripts/ensure_a_single_firewall_configuration_utility_is_in_use.sh",
    logoutput => true,
  }
}
