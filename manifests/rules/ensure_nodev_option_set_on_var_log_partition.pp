# @api private
#
# @summary Ensure nodev option set on /var/log partition 
#
class secure_linux_cis::rules::ensure_nodev_option_set_on_var_log_partition {
  if $facts['mountpoints']['/var/log'] {
    augeas { '/etc/fstab - nodev on /var/log':
      context => '/files/etc/fstab',
      changes => [
        "ins opt after /files/etc/fstab/*[file = '/var/log']/opt[last()]",
        "set *[file = '/var/log']/opt[last()] nodev",
      ],
      onlyif  => "match *[file = '/var/log']/opt[. = 'nodev'] size == 0",
    }
  }
}
