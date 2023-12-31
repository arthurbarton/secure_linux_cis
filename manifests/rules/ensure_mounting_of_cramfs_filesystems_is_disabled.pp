# @api private
#
# @summary Ensure mounting of cramfs filesystems is disabled 
#
class secure_linux_cis::rules::ensure_mounting_of_cramfs_filesystems_is_disabled {
  realize File['/etc/modprobe.d/filesystem_disable.conf']

  file_line { 'Disable cramfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'install cramfs /bin/false',
    match   => '^install\s+cramfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  file_line { 'Blacklist cramfs':
    ensure  => present,
    path    => '/etc/modprobe.d/filesystem_disable.conf',
    line    => 'blacklist cramfs',
    match   => '^blacklist\s+cramfs',
    require => File['/etc/modprobe.d/filesystem_disable.conf'],
  }

  exec { '/usr/sbin/modprobe -r cramfs':
    subscribe   => [File_line['Disable cramfs'], File_line['Blacklist cramfs']],
    refreshonly => true,
  }
}
