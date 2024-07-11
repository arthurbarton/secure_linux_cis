# @api private
#
# @summary Ensure host based firewall loopback traffic is configured
#
class secure_linux_cis::rules::ensure_host_based_firewall_loopback_traffic_is_configured {
  file { '/usr/share/cis_scripts/ensure_host_based_firewall_loopback_traffic_is_configured.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_host_based_firewall_loopback_traffic_is_configured.sh'),
    before  => Exec['Ensure host based firewall loopback traffic is configured'],
  }
  exec { "Ensure host based firewall loopback traffic is configured":
    command   => "/usr/share/cis_scripts/ensure_host_based_firewall_loopback_traffic_is_configured.sh",
    logoutput => true,
  }
}
