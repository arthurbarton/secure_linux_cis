# @api private
#
# @summary Ensure at least one nftables table exists
#
class secure_linux_cis::rules::ensure_at_least_one_nftables_table_exists {
  file { '/usr/share/cis_scripts/ensure_at_least_one_nftables_table_exists.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_at_least_one_nftables_table_exists.sh'),
    before  => Exec['Ensure at least one nftables table exists'],
  }

  exec { 'Ensure at least one nftables table exists':
    command   => '/usr/share/cis_scripts/ensure_at_least_one_nftables_table_exists.sh',
    logoutput => true,
  }
}
