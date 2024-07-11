# @api private
#
# @summary Ensure default user shell timeout is 900 seconds or less
#
class secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less {
  file { '/usr/share/cis_scripts/ensure_default_user_shell_timeout_is_900_seconds_or_less.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_default_user_shell_timeout_is_900_seconds_or_less.sh'),
    before  => Exec['Ensure default user shell timeout is 900 seconds or less'],
  }
  exec { "Ensure default user shell timeout is 900 seconds or less":
    command   => "/usr/share/cis_scripts/ensure_default_user_shell_timeout_is_900_seconds_or_less.sh",
    logoutput => true,
  }
}
