# @api private
#
# @summary Ensure authselect includes with-faillock 
#
class secure_linux_cis::rules::ensure_authselect_includes_with_faillock {

  file { '/usr/share/cis_scripts/ensure_authselect_includes_with_faillock.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_authselect_includes_with_faillock.sh'),
  }

  exec { 'Ensure authselect includes with-faillock':
    require   => File['/usr/share/cis_scripts/ensure_authselect_includes_with_faillock.sh'],
    command   => '/usr/share/cis_scripts/ensure_authselect_includes_with_faillock.sh',
    unless    => '/usr/bin/grep -q pam_faillock.so /etc/pam.d/password-auth /etc/pam.d/system-auth',
    logoutput => true,
  }
}
