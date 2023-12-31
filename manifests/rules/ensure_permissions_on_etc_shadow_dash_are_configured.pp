# @api private
#
# @summary Ensure permissions on /etc/shadow- are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_shadow_dash_are_configured {
  $os = "${facts['os']['name']}${facts['os']['release']['major']}"
  $mode = $os ? {
    'Debian10'    => '0600',
    'Debian9'     => '0640',
    'Ubuntu16.04' => '0640',
    'Ubuntu18.04' => '0640',
    default       => '0000',
  }

  case $facts['osfamily'] {
    'RedHat': {
      file { '/etc/shadow-':
        ensure => file,
        owner  => 'root',
        group  => 'root',
        mode   => '0000',
      }
    }
    'Debian': {
      file { '/etc/shadow-':
        ensure => file,
        owner  => 'root',
        group  => 'shadow',
        mode   => $mode,
      }
    }
    default: {
      warning ("shadow- configuration not supported on os family ${facts['osfamily']}.")
    }
  }
}
