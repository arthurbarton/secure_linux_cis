# @api private
#
# @summary Ensure password hashing algorithm is SHA-512 or yescrypt
#
class secure_linux_cis::rules::ensure_password_hashing_algorithm_is_sha_512_or_yescrypt (
    String $crypt_style_login_defs = 'SHA512',
    String $encrypt_method_libuser_conf = 'sha512',

) {
  file { '/usr/share/cis_scripts/ensure_a_single_firewall_configuration_utility_is_in_use.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => file('secure_linux_cis/ensure_a_single_firewall_configuration_utility_is_in_use.sh'),
    before  => Exec['Ensure a single firewall configuration utility is in use'],
  }
  file_line { 'Ensure ENCRYPT_METHOD set properly':
    path  => '/etc/login.defs',
    match => '^\s*ENCRYPT_METHOD\s+',
    line  => "ENCRYPT_METHOD $crypt_style_login_defs",
  }
  file_line { 'ensure crypt_style is set to sha512 in /etc/libuser.conf':
    ensure => present,
    path   => '/etc/libuser.conf',
    match  => '^\s*crypt_style\s*=',
    line   => "crypt_style = $encrypt_method_libuser_conf",
    multiple  => true,
  }
  exec { "Ensure password hashing algorithm is SHA-512 or yescrypt":
    command   => "/usr/share/cis_scripts/ensure_password_hashing_algorithm_is_sha_512_or_yescrypt.sh",
    logoutput => true,
  }
}
