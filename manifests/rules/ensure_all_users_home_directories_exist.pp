# @api private
#
# @summary Ensure all users' home directories exist 
#
class secure_linux_cis::rules::ensure_all_users_home_directories_exist {
  file { '/usr/share/cis_scripts/home_directory.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/home_directory.sh'),
  }
  unless $facts['home_directory'].empty {
    notify { 'hdir':
      message  => 'Not in compliance with CIS (Scored). You have user(s) without a home directory. Check the home_directory fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
