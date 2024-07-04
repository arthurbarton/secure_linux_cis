# @api private
#
# @summary Ensure local interactive user home directories are mode 750 or more restrictive
#
class secure_linux_cis::rules::ensure_local_interactive_user_home_directories_are_mode_750_or_more_restrictive {
  file { '/usr/share/cis_scripts/ensure_local_interactive_user_home_directories_are_mode_750_or_more_restrictive.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_local_interactive_user_home_directories_are_mode_750_or_more_restrictive.sh'),
    before  => Exec['Ensure local interactive user home directories are mode 750 or more restrictive'],
  }
  exec { 'Ensure local interactive user home directories are mode 750 or more restrictive':
    command   => '/usr/share/cis_scripts/ensure_local_interactive_user_home_directories_are_mode_750_or_more_restrictive.sh',
    logoutput => true,
  }
}
